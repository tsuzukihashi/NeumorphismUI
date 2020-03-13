import SwiftUI

@available(iOS 13.0, *)
class NeumorphismManagerMock: NeumorphismManagable {
    var fontColorCallCount = 0
    var fontColorArgs: (lightColor: Color?, darkColor: Color?)?
    func fontColor(lightColor: Color?, darkColor: Color?) -> Color {
        fontColorCallCount += 1
        fontColorArgs?.lightColor = lightColor
        fontColorArgs?.darkColor = darkColor
        return lightColor ?? Color.white
    }
    
    var changeModeCallCount = 0
    func changeMode() {
        changeModeCallCount += 1
    }
}
