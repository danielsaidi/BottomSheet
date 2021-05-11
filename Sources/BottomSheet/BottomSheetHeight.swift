//
//  BottomSheetHeight.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This enum defines the heights that a bottom sheet can have.
 */
public enum BottomSheetHeight {
    
    /// The total available height.
    case available
    
    /// A percentage of the total available height (0-1).
    case percentage(CGFloat)
    
    /// A fixed number of points.
    case points(CGFloat)
}
