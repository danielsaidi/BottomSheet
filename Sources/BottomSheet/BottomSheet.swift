//
//  BottomSheet.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be used to enforce views that behave like
 a bottom sheet.
 */
public protocol BottomSheetView: View {}

/**
 This view can be used to place any content bottom-most in a
 fake sheet that can be dragged up manully or toggled with a
 `bool` binding.
 
 This implementation is based on the outstanding demo bottom
 sheet made by `@mecid`. The original code can be found here:
 
 https://gist.github.com/mecid/78eab34d05498d6c60ae0f162bfd81ee
 */
public struct BottomSheet<Content: View>: BottomSheetView {
    
    /// Create a bottom sheet instance.
    ///
    /// - Parameters:
    ///   - isExpanded: Whether or not the sheet is expanded to its full height
    ///   - minHeight: The min height of the sheet, by default 100 points
    ///   - maxHeight: The max height of the sheet, by default the available height
    ///   - style: The style of the sheet
    ///   - content: The sheet's content, presented below the handle
    public init(
        isExpanded: Binding<Bool>,
        minHeight: BottomSheetHeight = .points(100),
        maxHeight: BottomSheetHeight = .available,
        style: BottomSheetStyle = .standard,
        @ViewBuilder content: () -> Content) {
        self._isExpanded = isExpanded
        self.maxHeight = maxHeight
        self.minHeight = minHeight
        self.style = style
        self.content = content()
    }

    private let content: Content
    private let maxHeight: BottomSheetHeight
    private let minHeight: BottomSheetHeight
    private let style: BottomSheetStyle
    
    @Binding private var isExpanded: Bool
    @GestureState private var translation: CGFloat = 0

    public var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                handle(for: geo)
                contentView(for: geo)
            }
            .frame(width: geo.size.width, height: maxHeight(in: geo), alignment: .top)
            .background(style.color)
            .cornerRadius(style.cornerRadius)
            .modified(with: style.modifier)
            // Add safe area inset to frame height in order to 'overflow' to the bottom of the screen
            .frame(height: geo.size.height + geo.safeAreaInsets.bottom, alignment: .bottom)
            .offset(y: max(offset(for: geo) + translation, 0))
            .animation(.interactiveSpring())
            
        }
    }
}

private extension BottomSheet {
    
    func contentView(for geo: GeometryProxy) -> some View {
        content
            .padding(.bottom, geo.safeAreaInsets.bottom)
    }
    
    func handle(for geo: GeometryProxy) -> some View {
        BottomSheetHandleBar(style: style.handleStyle)
            .onTapGesture(perform: toggleIsExpanded)
            .gesture(
                DragGesture().updating($translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let translationHeight = abs(value.translation.height)
                    let snapDistance = maxHeight(in: geo) * style.snapRatio
                    let shouldApply = translationHeight > snapDistance
                    guard shouldApply else { return }
                    isExpanded = value.translation.height < 0
                }
            )
    }
}


private extension BottomSheet {
    
    func height(of height: BottomSheetHeight, in geo: GeometryProxy) -> CGFloat {
        switch height {
        case .available: return geo.size.height + geo.safeAreaInsets.bottom
        case .percentage(let ratio): return ratio * (geo.size.height + geo.safeAreaInsets.bottom)
        case .points(let points): return points
        }
    }

    func minHeight(in geo: GeometryProxy) -> CGFloat {
        height(of: minHeight, in: geo)
    }
    
    func maxHeight(in geo: GeometryProxy) -> CGFloat {
        height(of: maxHeight, in: geo)
    }
    
    /**
     This is the vertical offset that's applied to the sheet.
     Since the sheet has a bottom alignment, increasing this
     offset will push the sheet down.
     */
    func offset(for geo: GeometryProxy) -> CGFloat {
        isExpanded ? 0 : maxHeight(in: geo) - minHeight(in: geo)
    }
    
    func toggleIsExpanded() {
        isExpanded.toggle()
    }
}

private extension View {
    
    func modified(with modifier: (AnyView) -> AnyView) -> some View {
        modifier(AnyView(self))
    }
}

struct BottomSheet_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var isExpanded = false
        
        var twentyItems: some View {
            VStack {
                ForEach(1...20, id: \.self) { index in
                    HStack {
                        Text("Item \(index)")
                        Spacer()
                        Button(
                            action: { print("Clicked \(index)") },
                            label: {
                                Image(systemName: "tray.and.arrow.down.fill")
                            })
                    }
                    .padding()
                    .frame(minHeight: 50)
                }
                // The bottom line
                Color.pink.frame(height: 1).id(-123)
            }
        }
        
        var twentyItemsList: some View {
            List {
                ForEach(1...20, id: \.self) { index in
                    Text("Item \(index)")
                }
            }
        }
        
        var body: some View {
            Group {
                
                //
                // ScrollView
                if #available(iOS 14.0, *) {
                    BottomSheet(isExpanded: $isExpanded, maxHeight: .available) {
                        ScrollViewReader { scroll in
                            ScrollView {
                                twentyItems.onAppear {
                                    // Scroll to bottom in order to see if the padding is applied correctly
                                    // Oddly, this renders only correctly if you run the live preview. In the static preview, the last element is still stuck in the safe area, or even below...
                                    scroll.scrollTo(-123)
                                }
                            }
                        }
                    }
                }
                
                BottomSheet(isExpanded: $isExpanded, maxHeight: .percentage(1)) {
                    ScrollView {
                        twentyItems
                    }
                }
                
                //
                // List
                if #available(iOS 14.0, *) {
                    BottomSheet(isExpanded: $isExpanded, maxHeight: .percentage(0.6)) {
                        ScrollViewReader { scroll in
                            twentyItemsList.onAppear {
                                // Scroll to bottom in order to see if the padding is applied correctly
                                scroll.scrollTo(-123)
                            }
                        }
                    }
                }
                
                BottomSheet(isExpanded: $isExpanded, maxHeight: .percentage(0.6)) {
                        twentyItemsList
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
