import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismShadowModifier: ViewModifier {
    @EnvironmentObject var neumorphism: NeumorphismManager

    private let darkShadowColor: Color?
    private let lightShadowColor: Color?
    
    private let radius: CGFloat
    private let x: CGFloat
    private let y: CGFloat
    
    public init(darkShadowColor: Color? = nil, lightShadowColor: Color? = nil, radius: CGFloat = 8, x: CGFloat = 4, y: CGFloat = 4, isAnimation: Bool = false) {
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        if isAnimation {
            self.x = -x/2
            self.y = -y/2
            self.radius = radius / 4

        } else {
            self.x = x
            self.y = y
            self.radius = radius
        }
    }
    
    public func body(content: Content) -> some View {
        content
            .shadow(
                color: darkShadowColor ?? neumorphism.color.darkerColor(),
                radius: radius,
                x: x, y: y
        )
            .shadow(
                color: lightShadowColor ?? neumorphism.color.lighterColor(),
                radius: radius,
                x: -x, y: -y
        )
    }
}
