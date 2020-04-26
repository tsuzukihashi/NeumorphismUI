import SwiftUI
import NeumorphismUI

struct SimpleView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            Circle()
                .fill(neumorphism.color)
                .frame(width: 200, height: 200)
                .neumorphismShadow()
        }
    }
}

struct SimpleView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        isDark: false,
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        SimpleView()
            .environmentObject(neumorphism)
            .previewLayout(.sizeThatFits)
    }
}

