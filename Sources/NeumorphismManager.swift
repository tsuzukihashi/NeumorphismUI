import SwiftUI

@available(iOS 13.0, *)
public protocol NeumorphismManagable {
    func changeMode()
    func fontColor(lightColor: Color?, darkColor: Color?) -> Color
}

@available(iOS 13.0, *)
public class NeumorphismManager: NeumorphismManagable, ObservableObject {
    @Published public var isDark: Bool
    @Published public var color: Color
    
    private let lightColor: Color
    private let darkColor: Color
    
    public init(isDark: Bool = UserDefaults.standard.bool(forKey: "isDark"), lightColor: Color = Color(hex: "C1D2EB"), darkColor: Color = Color(hex: "2C292C")) {
        self.lightColor = lightColor
        self.darkColor = darkColor
        self.isDark = isDark
        self.color = isDark ? darkColor : lightColor
    }
    
    public func changeMode() {
        isDark.toggle()
        color = isDark ? darkColor : lightColor
        UserDefaults.standard.set(isDark, forKey: "isDark")
    }
    
    public func fontColor(lightColor: Color? = nil, darkColor: Color? = nil) -> Color {
        if isDark {
            return lightColor ?? self.color.lighterColor().lighterColor().lighterColor().lighterColor()
        } else {
            return darkColor ?? self.color.darkerColor().darkerColor().darkerColor()
        }
    }
}
