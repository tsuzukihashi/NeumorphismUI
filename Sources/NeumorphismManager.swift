import SwiftUI

@available(iOS 13.0, *)
public protocol NeumorphismManagable {
    func changeMode()
    func fontColor(lightColor: Color?, darkColor: Color?) -> Color
    func setLightColor(color: Color)
    func setDarkColor(color: Color)
}

@available(iOS 13.0, *)
public class NeumorphismManager: NeumorphismManagable, ObservableObject {
    @Published public var isDark: Bool
    @Published public var color: Color
    
    private var lightColor: Color
    private var darkColor: Color
    
    public init(
        isDark: Bool = UserDefaults.standard.bool(forKey: "isDark"),
        lightColor: Color = Color(hex: "C1D2EB"),
        darkColor: Color = Color(hex: "2C292C")
    ) {
        self.lightColor = lightColor
        self.darkColor = darkColor
        self.isDark = isDark
        self.color = isDark ? darkColor : lightColor
    }
    
    public func setLightColor(color: Color) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.lightColor = color
            
            if !self.isDark {
                self.color = color
            }
        }
    }
    
    public func setDarkColor(color: Color) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.darkColor = color
            
            if self.isDark {
                self.color = color
            }
        }
    }
    
    public func changeMode() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isDark.toggle()
            self.color = self.isDark ? self.darkColor : self.lightColor
            UserDefaults.standard.set(self.isDark, forKey: "isDark")
        }
    }
    
    public func fontColor(lightColor: Color? = nil, darkColor: Color? = nil) -> Color {
        if isDark {
            return lightColor ?? self.color.lighterColor().lighterColor().lighterColor().lighterColor()
        } else {
            return darkColor ?? self.color.darkerColor().darkerColor().darkerColor()
        }
    }
}
