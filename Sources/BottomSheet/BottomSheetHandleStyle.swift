//
//  BottomSheetHandleStyle.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct can be used to style a ``BottomSheetHandle`` or
 an entire ``BottomSheetHandleBar``.
 */
public struct BottomSheetHandleStyle {
    
    /**
     Create a bottom sheet handle instance.
     
     - Parameters:
       - handleColor: The color of the handle.
       - backgroundColor: The background color.
       - dividerColor: The color of the divider below the handle.
       - width: The handle width.
       - height: The handle height.
       - padding: The padding to add around the handle.
       - cornerRadius: The handle corner radius.
     */
    public init(
        handleColor: Color = Color.secondary,
        backgroundColor: Color = Color.primary.opacity(0.02),
        dividerColor: Color? = Color.primary.opacity(0.1),
        width: CGFloat = 50,
        height: CGFloat = 6,
        padding: EdgeInsets? = nil,
        cornerRadius: CGFloat = 16) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.dividerColor = dividerColor
        self.handleColor = handleColor
        self.padding = padding
        self.size = CGSize(width: width, height: height)
    }
    
    /**
     The background color.
     */
    public var backgroundColor: Color
    
    /**
     The handle corner radius.
     */
    public var cornerRadius: CGFloat
    
    /**
     The color of the divider below the handle.
     */
    public var dividerColor: Color?
    
    /**
     The color of the handle.
     */
    public var handleColor: Color
    
    /**
     The padding to add around the handle.
     */
    public var padding: EdgeInsets?
    
    /**
     The size of the handle.
     */
    public var size: CGSize
}

public extension BottomSheetHandleStyle {
    
    /**
     The standard bottom sheet handle style.
     
     You can override this value to change the default style
     of all bottom sheet handles.
     */
    static var standard = BottomSheetHandleStyle()
}
