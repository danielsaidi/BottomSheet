//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    
    @State private var isVisible = true
    @State private var isExpanded = false
    @State private var useTallerMinHeight = false
    @State private var useShorterMaxHeight = false
    @State private var sheetStyle = BottomSheetStyle.standard
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    Section(header: Text("").frame(height: 1)) {
                        Toggle("Is visible", isOn: $isVisible)
                        Toggle("Is expanded", isOn: $isExpanded)
                        Toggle("Use taller min height", isOn: $useTallerMinHeight)
                        Toggle("Use shorter max height", isOn: $useShorterMaxHeight)
                    }
                    
                    Section(header: Text("Sheet Styles").frame(height: 1)) {
                        sheetStyleButton("Standard", style: .standard)
                        sheetStyleButton("(Demo) Red", style: .demoRed)
                        sheetStyleButton("(Demo) Green", style: .demoGreen)
                        sheetStyleButton("(Demo) Blue", style: .demoBlue)
                        sheetStyleButton("(Demo) Larger Corner Radius", style: .demoRound)
                    }
                    
                    Section(header: Text("Sheet Handle Styles").frame(height: 1), footer: bottomPadding) {
                        sheetHandleStyleButton("Standard", style: .standard)
                        sheetHandleStyleButton("(Demo) Blue", style: .demoBlue)
                        sheetHandleStyleButton("(Demo) Green", style: .demoGreen)
                        sheetHandleStyleButton("(Demo) Red", style: .demoRed)
                        sheetHandleStyleButton("(Demo) Large Yellow", style: .demoLargeYellow)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .navigationTitle("Bottom Sheet Demo")
                .listStyle(InsetGroupedListStyle())
            }
        }
        .bottomSheet(sheet, if: isVisible)
        .navigationViewStyle(.stack)
    }
}

private extension ContentView {
    
    var bottomPadding: some View {
        Color.clear.frame(height: useTallerMinHeight ? 280 : 130)
    }
    
    var sheet: some BottomSheetView {
        BottomSheet(
            isExpanded: $isExpanded,
            minHeight: useTallerMinHeight ? .points(300) : .points(150),
            maxHeight: useShorterMaxHeight ? .percentage(0.5) : .available,
            style: sheetStyle) {
                Group {
                    if isExpanded {
                        DemoSheetContent(style: sheetStyle)
                    } else {
                        List {
                            Text("Collapsed view")
                        }
                    }
                }
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.4), radius: 1, x: 0, y: 0)
                .padding()
        }
    }
    
    func listButton(_ text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(text)
                Spacer()
            }.background(Color.white.opacity(0.0001))
        }
    }
    
    func sheetStyleButton(_ text: String, style: BottomSheetStyle) -> some View {
        listButton(text) {
            var style = style
            style.handleStyle = sheetStyle.handleStyle
            sheetStyle = style
        }
    }
    
    func sheetHandleStyleButton(_ text: String, style newStyle: BottomSheetHandleStyle) -> some View {
        listButton(text) {
            var style = sheetStyle
            style.handleStyle = newStyle
            sheetStyle = style
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
