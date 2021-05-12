//
//  DemoSheetContent.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-05-12.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import BottomSheet
import SwiftUI

struct DemoSheetContent: View {
    
    var style: BottomSheetStyle
    
    var body: some View {
        List {
            ForEach(0..<100, id: \.self) {
                Text("\($0)")
            }.listRowBackground(style.color)
        }
    }
}

struct DemoSheetContent_Previews: PreviewProvider {
    static var previews: some View {
        DemoSheetContent(style: .standard)
    }
}
