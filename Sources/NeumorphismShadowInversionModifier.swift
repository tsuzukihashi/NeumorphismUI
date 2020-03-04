import SwiftUI

@available(iOS 13.0, *)
public struct NUDepressionCircle: ViewModifier {
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
            .shadow(color: darkShadowColor ?? baseColor.darkerColor(), radius: radius, x: -x, y: -y)
            .shadow(color: lightShadowColor ?? baseColor.lighterColor(), radius: radius, x: x, y: y)
    }
}


@available(iOS 13.0, *)
public struct NUDepressionRoundedRectangle: ViewModifier {
    @Environment(\.baseColor) private var baseColor: Color
    
    private let darkShadowColor: Color?
    private let lightShadowColor: Color?
    private let cornerRadius: CGFloat
    private let lineWidth: CGFloat
    private let radius: CGFloat
    private let x: CGFloat
    private let y: CGFloat
    private var isAnimation: Bool
    
    
    public init(darkShadowColor: Color? = nil, lightShadowColor: Color? = nil, radius: CGFloat = 4, x: CGFloat = 4, y: CGFloat = 4, lineWidth: CGFloat = 4, cornerRadius: CGFloat = 16, isAnimation: Bool = false) {
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        if isAnimation {
            self.x = x
            self.y = y
            self.radius = radius
        } else {
            self.x = 9
            self.y = 9
            self.radius = 16
        }
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
        self.isAnimation = isAnimation
    }
    
    public func body(content: Content) -> some View {
        return content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(baseColor, lineWidth: 2)
                    .shadow(
                        color: isAnimation ? (darkShadowColor ?? baseColor.darkerColor()) : .clear,
                        radius: isAnimation ? 4 : 0,
                        x:  isAnimation ? 4 : 0,
                        y: isAnimation ? 4 : 0)
//                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .shadow(
                        color: isAnimation ? (lightShadowColor ?? baseColor.lighterColor()) : .clear,
                        radius: isAnimation ? 2 : 0,
                        x: isAnimation ? -2 : 0,
                        y: isAnimation ? -2 : 0)
//                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        )
            
                    .shadow(
                        color: isAnimation ? .clear : (darkShadowColor ?? baseColor.darkerColor()),
                        radius: radius,
                        x: isAnimation ? 0 : 9,
                        y: isAnimation ? 0 : 9
                )
                    .shadow(
                        color: isAnimation ? .clear : (lightShadowColor ?? baseColor.lighterColor()),
                        radius: radius,
                        x: isAnimation ? 0 : -9,
                        y: isAnimation ? 0 : -9
                )
        
    }
}
