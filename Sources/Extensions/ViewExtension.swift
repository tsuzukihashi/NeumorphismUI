import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func neumorphismShadow(
        darkShadowColor: Color? = nil,
        lightShadowColor: Color? = nil,
        radius: CGFloat = 16,
        x: CGFloat = 8,
        y: CGFloat = 8,
        isAnimation: Bool = false
    ) -> some View {
        self.modifier(NeumorphismShadowModifier(
            darkShadowColor: darkShadowColor,
            lightShadowColor: lightShadowColor,
            radius: radius,
            x: x,
            y: y,
            isAnimation: isAnimation
        ))
    }
}
