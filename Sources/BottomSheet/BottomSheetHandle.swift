//
//  BottomSheetHandle.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This is the thin, rounded handle that is added topmost in a
 `BottomSheet`. It has no built-in behavior.
 */
public struct BottomSheetHandle: View {
    
    public init(style: BottomSheetHandleStyle = .standard) {
        self.style = style
    }
    
    private let style: BottomSheetHandleStyle
    
    public var body: some View {
        RoundedRectangle(cornerRadius: style.cornerRadius)
            .fill(style.handleColor)
            .frame(width: style.size.width, height: style.size.height)
    }
}

struct BottomSheetHandle_Previews: PreviewProvider {
    
    static var previews: some View {
        BottomSheetHandle()
    }
}
