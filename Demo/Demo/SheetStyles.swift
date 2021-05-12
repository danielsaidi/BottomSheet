//
//  SheetStyles.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import BottomSheet

extension BottomSheetStyle {
    
    static var red: BottomSheetStyle {
        BottomSheetStyle(color: .red)
    }
    
    static var green: BottomSheetStyle {
        BottomSheetStyle(color: .green)
    }
    
    static var blue: BottomSheetStyle {
        BottomSheetStyle(color: .blue)
    }
    
    static var round: BottomSheetStyle {
        BottomSheetStyle(cornerRadius: 40)
    }
}

extension BottomSheetHandleStyle {
    
    static var red: BottomSheetHandleStyle {
        BottomSheetHandleStyle(color: .red)
    }
    
    static var green: BottomSheetHandleStyle {
        BottomSheetHandleStyle(color: .green)
    }
    
    static var blue: BottomSheetHandleStyle {
        BottomSheetHandleStyle(color: .blue)
    }
    
    static var round: BottomSheetHandleStyle {
        BottomSheetHandleStyle(cornerRadius: 40)
    }
}
