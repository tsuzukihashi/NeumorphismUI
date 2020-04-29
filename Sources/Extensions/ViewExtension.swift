import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func neumorphismShadow(
        baseColor: Color? = nil,
        radius: CGFloat = 16,
        x: CGFloat = 8,
        y: CGFloat = 8,
        isAnimation: Bool = false
    ) -> some View {
        self.modifier(NeumorphismShadowModifier(
            baseColor: baseColor,
            radius: radius,
            x: x,
            y: y,
            isAnimation: isAnimation
        ))
    }
    
    func neumorphismConcave(
        shapeType: ShapeType = .circle,
        color: Color? = nil
    ) -> some View {
        self.modifier(NeumorphismConcaveModifier(
            shapeType: shapeType, color: color
        ))
    }
}
