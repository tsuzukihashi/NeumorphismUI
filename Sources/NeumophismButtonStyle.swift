//
//  NeumophismButtonStyle.swift
//  NeumorphismUI
//
//  Created by Ryo Tsuzukihashi on 2024/08/16.
//

import SwiftUI

public struct NeumorphismButtonStyle: ButtonStyle {
  @EnvironmentObject var neumorphism: NeumorphismManager

  private var shapeType: ShapeType
  private let baseColor: Color?

  init(shapeType: ShapeType, baseColor: Color?) {
    self.shapeType = shapeType
    self.baseColor = baseColor
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(
        Rectangle()
          .clipShape(shapeType.anyShape)
          .foregroundColor(baseColor ?? neumorphism.color)
          .modifier(
            configuration.isPressed
            ? NeumorphismShadowModifier(baseColor: baseColor ?? neumorphism.color, radius: 8, isAnimation: configuration.isPressed)
            : NeumorphismShadowModifier(baseColor: baseColor ?? neumorphism.color, radius: 8, isAnimation: configuration.isPressed)
          )
      )
      .animation(.spring(response: 0.2, dampingFraction: 0.9), value: configuration.isPressed)
  }
}

public extension ButtonStyle where Self == NeumorphismButtonStyle {
  static func neumorphismButton(shapeType: ShapeType, baseColor: Color? = nil) -> Self {
    .init(shapeType: shapeType, baseColor: baseColor)
  }
}

// MARK: - Deprecated aliases for backward compatibility

@available(*, deprecated, renamed: "NeumorphismButtonStyle")
public typealias NeumophismButtonStyle = NeumorphismButtonStyle

public extension ButtonStyle where Self == NeumorphismButtonStyle {
  @available(*, deprecated, renamed: "neumorphismButton")
  static func neumophismButton(shapeType: ShapeType, baseColor: Color? = nil) -> Self {
    .init(shapeType: shapeType, baseColor: baseColor)
  }
}
