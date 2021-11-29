import SwiftUI

public extension BottomSheetHandleStyle {
    
    @available(*, deprecated, message: "Use handleColor initializer instead")
    init(
        color: Color,
        width: CGFloat = 50,
        height: CGFloat = 6,
        cornerRadius: CGFloat = 16) {
        self.handleColor = color
        self.backgroundColor = Color.white.opacity(0.0001)
        self.size = CGSize(width: width, height: height)
        self.cornerRadius = cornerRadius
    }
    
    @available(*, deprecated, renamed: "handleColor")
    var color: Color { handleColor }
}
