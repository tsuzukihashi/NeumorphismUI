//
//  NeumophismButtonStyle.swift
//  NeumorphismUI
//
//  Created by Ryo Tsuzukihashi on 2024/08/16.
//

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 12.0, *)
public struct NeumophismButtonStyle: ButtonStyle {
  @EnvironmentObject var neumorphism: NeumorphismManager

  private var shapeType: ShapeType

  init(shapeType: ShapeType) {
    self.shapeType = shapeType
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(
        Rectangle()
          .clipShape(shapeType.anyShape)
          .foregroundColor(neumorphism.color)
          .modifier(
            configuration.isPressed
            ? NeumorphismShadowModifier(baseColor: neumorphism.color, radius: 8, isAnimation: configuration.isPressed)
            : NeumorphismShadowModifier(baseColor: neumorphism.color, radius: 8, isAnimation: configuration.isPressed)
          )
      )
      .animation(.spring(response: 0.2, dampingFraction: 0.9), value: configuration.isPressed)
  }
}

public extension ButtonStyle where Self == NeumophismButtonStyle {
  static func neumophismButton(shapeType: ShapeType) -> Self {
    .init(shapeType: shapeType)
  }
}
