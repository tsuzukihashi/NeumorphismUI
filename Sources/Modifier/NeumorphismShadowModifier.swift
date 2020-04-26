import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismShadowModifier: ViewModifier {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    private let baseColor: Color?
    
    private let radius: CGFloat
    private let x: CGFloat
    private let y: CGFloat
    
    public init(
        baseColor: Color? = nil,
        radius: CGFloat = 16,
        x: CGFloat = 8,
        y: CGFloat = 8,
        isAnimation: Bool = false
    ) {
        self.baseColor = baseColor
        if isAnimation {
            self.x = -x / 2
            self.y = -y / 2
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
                color: baseColor?.darkerColor() ?? neumorphism.color.darkerColor(),
                radius: radius,
                x: x, y: y
        )
            .shadow(
                color: baseColor?.lighterColor() ?? neumorphism.color.lighterColor(),
                radius: radius,
                x: -x, y: -y
        )
    }
}
