//
//  View+BottomSheet.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Add a bottom sheet above the view.
     */
    func bottomSheet<Sheet: BottomSheetView>(_ sheet: Sheet) -> some View {
        ZStack {
            self
            sheet
        }
    }
    
    /**
     Add a bottom sheet above the view, if the provided bool
     `condition` is met.
     */
    @ViewBuilder
    func bottomSheet<Sheet: BottomSheetView>(_ sheet: Sheet, if condition: Bool) -> some View {
        if condition {
            self.bottomSheet(sheet)
        } else {
            self
        }
    }
}
