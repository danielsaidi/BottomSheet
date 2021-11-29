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
        backgroundColor: Color = Color.white.opacity(0.0001),
        dividerColor: Color? = nil,
        width: CGFloat = 50,
        height: CGFloat = 6,
        cornerRadius: CGFloat = 16) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.dividerColor = dividerColor
        self.handleColor = handleColor
        self.size = CGSize(width: width, height: height)
    }
    
    /// The color of the handle background
    public let backgroundColor: Color
    
    /// The corner radius of the handle
    public let cornerRadius: CGFloat
    
    /// The color of the handle divider
    public let dividerColor: Color?
    
    /// The color of the handle
    public let handleColor: Color
    
    /// The size of the handle
    public let size: CGSize
    
    /// The standard bottom sheet handle style
    public static var standard: BottomSheetHandleStyle { BottomSheetHandleStyle() }
}
