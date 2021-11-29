//
//  DemoStyles.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import BottomSheet

extension BottomSheetStyle {
    
    static var demoRed: BottomSheetStyle {
        BottomSheetStyle(color: .red)
    }
    
    static var demoGreen: BottomSheetStyle {
        BottomSheetStyle(color: .green)
    }
    
    static var demoBlue: BottomSheetStyle {
        BottomSheetStyle(color: .blue)
    }
    
    static var demoRound: BottomSheetStyle {
        BottomSheetStyle(cornerRadius: 40)
    }
}

extension BottomSheetHandleStyle {
    
    static var demoRed: BottomSheetHandleStyle {
        BottomSheetHandleStyle(handleColor: .red)
    }
    
    static var demoGreen: BottomSheetHandleStyle {
        BottomSheetHandleStyle(handleColor: .green)
    }
    
    static var demoBlue: BottomSheetHandleStyle {
        BottomSheetHandleStyle(handleColor: .blue)
    }
    
    static var demoLargeYellow: BottomSheetHandleStyle {
        BottomSheetHandleStyle(
            handleColor: .yellow,
            width: 250,
            height: 40,
            cornerRadius: 20)
    }
}
