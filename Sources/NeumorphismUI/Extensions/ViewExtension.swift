import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func neumorphismShadow() -> some View {
        self.modifier(NeumorphismShadowModifier())
    }
}
