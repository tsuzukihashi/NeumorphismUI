import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismShadowModifier: ViewModifier {
    @Environment(\.baseColor) private var baseColor: Color
    
    private let darkShadowColor: Color?
    private let lightShadowColor: Color?
    
    private let radius: CGFloat
    private let x: CGFloat
    private let y: CGFloat
    
    public init(darkShadowColor: Color? = nil, lightShadowColor: Color? = nil, radius: CGFloat = 16, x: CGFloat = 9, y: CGFloat = 9) {
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    public func body(content: Content) -> some View {
        content
            .shadow(color: darkShadowColor ?? baseColor.darkerColor(), radius: radius, x: x, y: y)
            .shadow(color: lightShadowColor ?? baseColor.lighterColor(), radius: radius, x: -x, y: -y)
    }
}
