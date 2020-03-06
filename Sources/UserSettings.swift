import SwiftUI
import Combine

@available(iOS 13.0, *)
public class Neumorphism: ObservableObject {
    private let lightColor: Color
    private let darkColor: Color

    @Published public var isDark: Bool
    @Published public var color: Color

    public init(isDark: Bool = false, lightColor: Color = Color(hex: "C1D2EB"), darkColor: Color = Color(hex: "2C292C")) {
        self.lightColor = lightColor
        self.darkColor = darkColor
        self.isDark = isDark
        self.color = isDark ? darkColor : lightColor
    }
}
