//
//  Color+Sheet.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Color {
    
    static var bottomSheet: Color = color(for: .bottomSheet)
}

private extension Color {
    
    static func color(for color: SheetColor) -> Color {
        color.color
    }
}

struct ColorResources_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(SheetColor.allCases) { color in
                HStack {
                    color.color
                    color.color.colorScheme(.dark)
                }.frame(height: 100)
            }
        }.previewLayout(.sizeThatFits)
    }
}
