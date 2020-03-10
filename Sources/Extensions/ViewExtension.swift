import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func neumorphismShadow(isAnimation: Bool = false) -> some View {
        self.modifier(NeumorphismShadowModifier(isAnimation: isAnimation))
    }
}
