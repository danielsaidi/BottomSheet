//
//  BottomSheetStyle.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct can be used to style a `BottomSheet`.
 */
public struct BottomSheetStyle {
    
    /// Create a bottom sheet style.
    ///
    /// - Parameters:
    ///   - color: The color of the sheet
    ///   - cornerRadius: The corner radius of the sheet
    ///   - modifier: The modifier to apply to the sheet
    ///   - snapRatio: The drag gesture snap ratio in percent of the max height, after which the sheet slides to the full height
    ///   - handleStyle: The bottom sheet's handle style
    public init(
        color: Color = .bottomSheet,
        cornerRadius: CGFloat = 16,
        modifier: @escaping Modifier = BottomSheetStyle.standardModifier,
        snapRatio: CGFloat = 0.25,
        handleStyle: BottomSheetHandleStyle = .standard) {
        self.color = color
        self.cornerRadius = cornerRadius
        self.modifier = modifier
        self.snapRatio = snapRatio
        self.handleStyle = handleStyle
    }

    public typealias Modifier = (AnyView) -> AnyView
    
    
    /**
     The color of the sheet.
     */
    public let color: Color
    
    /**
     The corner radius of the sheet.
     */
    public let cornerRadius: CGFloat
    
    /**
     The bottom sheet's handle style.
     */
    public let handleStyle: BottomSheetHandleStyle
    
    /**
     The modifier to apply to the sheet.
     */
    public let modifier: (AnyView) -> AnyView
    
    /**
     The drag gesture snap ratio, after which the sheet slides to the full height.
     */
    public let snapRatio: CGFloat
    
    /**
     The standard bottom sheet style.
     */
    public static var standard: BottomSheetStyle { BottomSheetStyle() }
    
    /**
     The standard bottom sheet style.
     */
    public static func standardModifier(view: AnyView) -> AnyView {
        AnyView(view.shadow(color: .black.opacity(0.2), radius: 5))
    }
}
