import SwiftUI

public protocol NeumorphismManagable {
    func changeMode()
}

@available(iOS 13.0, *)
public class NeumorphismManager: NeumorphismManagable, ObservableObject {
    @Published public var isDark: Bool
    @Published public var color: Color
    
    private let lightColor: Color
    private let darkColor: Color
    
    public init(isDark: Bool = false, lightColor: Color = Color(hex: "C1D2EB"), darkColor: Color = Color(hex: "2C292C")) {
        self.lightColor = lightColor
        self.darkColor = darkColor
        self.isDark = isDark
        self.color = isDark ? darkColor : lightColor
    }
    
    public func changeMode() {
        isDark.toggle()
        if isDark {
            color = darkColor
        } else {
            color = lightColor
        }
    }
}
