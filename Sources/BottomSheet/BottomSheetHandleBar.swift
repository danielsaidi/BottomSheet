//
//  BottomSheetHandleBar.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This is the entire bottom sheet handle "section", including
 the handle view as well as its padding, the divider etc.
 
 To only create a handle, use ``BottomSheetHandle`` instead.
 */
public struct BottomSheetHandleBar: View {
    
    /**
     Create a handle bottom sheet handle bar.
     
     - Parameters:
       - style: The style to apply to the bar handle.
     */
    public init(style: BottomSheetHandleStyle = .standard) {
        self.style = style
    }
    
    private let style: BottomSheetHandleStyle
    
    public var body: some View {
        VStack(spacing: 0) {
            BottomSheetHandle(style: style)
                .withHandlePadding(in: style)
            Divider().background(style.dividerColor)
        }.background(style.backgroundColor)
    }
}

private extension View {
    
    @ViewBuilder
    func withHandlePadding(in style: BottomSheetHandleStyle) -> some View {
        if let padding = style.padding {
            self.padding(padding)
        } else {
            self.padding()
        }
    }
}

struct BottomSheetHandleBar_Previews: PreviewProvider {
    
    static var previews: some View {
        BottomSheetHandleBar()
    }
}
