import SwiftUI

public extension View {
  func neumorphismShadow(
    baseColor: Color? = nil,
    radius: CGFloat = 16,
    x: CGFloat = 8,
    y: CGFloat = 8,
    isAnimation: Bool = false
  ) -> some View {
    modifier(NeumorphismShadowModifier(
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
    modifier(NeumorphismConcaveModifier(
      shapeType: shapeType, color: color
    ))
  }
}
