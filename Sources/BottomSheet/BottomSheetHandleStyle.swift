//
//  BottomSheetHandleStyle.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct can be used to style a `BottomSheetHandle`.
 */
public struct BottomSheetHandleStyle {
    
    /// Create a bottom sheet handle instance.
    ///
    /// - Parameters:
    ///   - color: The color of the handle
    ///   - width: The width of the handle
    ///   - height: The height of the handle
    ///   - cornerRadius: The corner radius of the handle
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
    
    /// The color of the handle background
    public var backgroundColor: Color
    
    /// The corner radius of the handle
    public var cornerRadius: CGFloat
    
    /// The color of the handle divider
    public var dividerColor: Color?
    
    /// The color of the handle
    public var handleColor: Color
    
    /// The padding to add around the handle
    public var padding: EdgeInsets?
    
    /// The size of the handle
    public var size: CGSize
    
    /// The standard bottom sheet handle style
    public static var standard: BottomSheetHandleStyle { BottomSheetHandleStyle() }
}
