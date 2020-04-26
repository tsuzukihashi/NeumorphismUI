import SwiftUI
import NeumorphismUI

struct SimpleView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    var body: some View {
        ZStack {
            Color(hex: "C1D2EB").edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color(hex: "C1D2EB"))
                .frame(width: 200, height: 200)
                .shadow(color: Color(hex: "C1D2EB").darkerColor(), radius: 16, x: 8, y: 8)
                .shadow(color: Color(hex: "C1D2EB").lighterColor(), radius: 16, x: -8, y: -8)
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
