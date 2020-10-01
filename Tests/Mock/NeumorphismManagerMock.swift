import SwiftUI
@testable import NeumorphismUI

@available(iOS 13.0, *)
class NeumorphismManagerMock: NeumorphismManagable {
    var isDark = false
    
    var fontColorCallCount = 0
    var fontColorArgs: (lightColor: Color?, darkColor: Color?)?
    func fontColor(lightColor: Color? = nil, darkColor: Color? = nil) -> Color {
        fontColorCallCount += 1
        fontColorArgs?.lightColor = lightColor
        fontColorArgs?.darkColor = darkColor
        if isDark {
            return lightColor ?? Color.white
        } else {
            return darkColor ?? Color.black
        }
    }
    
    var changeModeCallCount = 0
    func changeMode() {
        changeModeCallCount += 1
        isDark.toggle()
    }
    
    var setLightColorCallCount = 0
    var setLightColorArgs: Color?
    func setLightColor(color: Color) {
        setLightColorCallCount += 1
        setLightColorArgs = color
    }
    
    var setDarkColorCallCount = 0
    var setDarkColorArgs: Color?
    func setDarkColor(color: Color) {
        setDarkColorCallCount += 1
        setDarkColorArgs = color
    }
}
