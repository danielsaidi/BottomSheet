//
//  SheetColor.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This enum contains sheet-specific, resource-based colors.
 
 Colors are embedded as resources in the package and use the
 SPM generated `.module` bundle by default. When the library
 isn't using SPM, `.module` will be undefined and cause this
 linking to fail. CocoaPods solves this problem by adding an
 additional `Bundle+module` file that is ignored by SPM.
 
 Another problem with this is that SwiftUI previews will not
 work outside of this package, but crash since the module is
 not found. Make sure to use the `.preview` style when using
 bottom sheets in previews.
 */
public enum SheetColor: String, CaseIterable, Identifiable {
    
    case bottomSheet
}

public extension SheetColor {
    
    var id: String { rawValue }
    
    var color: Color {
        Color(resourceName, bundle: .module)
    }
    
    var resourceName: String { rawValue }
}

struct SheetColor_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            ForEach(SheetColor.allCases) { color in
                HStack {
                    color.color
                    color.color.colorScheme(.dark)
                }.frame(height: 100)
            }
        }.previewLayout(.sizeThatFits)
    }
}
