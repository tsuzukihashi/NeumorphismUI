import SwiftUI
import NeumorphismUI

struct NeumorphismButtonView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            NeumorphismButton(
                shapeType: .circle,
                width: 300,
                height: 300,
                imageWidth: 100,
                imageHeight: 100,
                shadowRadius: 8
            ) {
                print(#function)
            }
        }
    }
}

struct NeumorphismButtonView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        isDark: false,
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        NeumorphismButtonView()
            .environmentObject(neumorphism)
    }
}
