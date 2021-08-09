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

    private var handle: some View {
        BottomSheetHandle(style: style.handleStyle)
            .onTapGesture { self.isExpanded.toggle() }
    }

    public var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                handle.padding()
                // Add padding to content so that content does not go into safe area
                content.padding(.bottom, geo.safeAreaInsets.bottom)
            }
            .frame(width: geo.size.width, height: maxHeight(in: geo), alignment: .top)
            .background(style.color)
            .cornerRadius(style.cornerRadius)
            .modified(with: style.modifier)
                    // Add safe area inset to frame height in order to 'overflow' to the bottom of the screen
            .frame(height: geo.size.height + geo.safeAreaInsets.bottom, alignment: .bottom)
            .offset(y: max(offset(for: geo) + translation, 0))
            .animation(.interactiveSpring())
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
    
    func offset(for geo: GeometryProxy) -> CGFloat {
        isExpanded ? 0 : maxHeight(in: geo) - minHeight(in: geo)
    }
}

private extension View {
    
    func modified(with modifier: (AnyView) -> AnyView) -> some View {
        modifier(AnyView(self))
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var twentyItems: some View {
        VStack {
            ForEach(1...20, id: \.self) { i in
                HStack {
                    Text("Item \(i)")
                    Spacer()
                    Button(
                        action: { print("Clicked \(i)") },
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
    static var twentyItemsList: some View {
        List {
            ForEach(1...20, id: \.self) { i in
                Text("Item \(i)")
            }
            // The bottom line
            Color.pink.frame(height: 1).id(-123)
        }
    }
    static var previews: some View {
        Group {
            
            //
            // ScrollView
            if #available(iOS 14.0, *) {
                BottomSheet(isExpanded: .constant(true), maxHeight: .available) {
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
            BottomSheet(isExpanded: .constant(true), maxHeight: .percentage(1)) {
                ScrollView {
                    twentyItems
                }
            }
            
            //
            // List
            if #available(iOS 14.0, *) {
                BottomSheet(isExpanded: .constant(true), maxHeight: .percentage(0.6)) {
                    ScrollViewReader { scroll in
                        twentyItemsList.onAppear {
                            // Scroll to bottom in order to see if the padding is applied correctly
                            scroll.scrollTo(-123)
                        }
                    }
                }
            }
            BottomSheet(isExpanded: .constant(true), maxHeight: .percentage(0.6)) {
                    twentyItemsList
            }
        }
    }
}
