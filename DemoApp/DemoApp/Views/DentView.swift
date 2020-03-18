import SwiftUI
import NeumorphismUI

struct DentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager

    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            NeumorphismDentView(width: 300, height: 300, cornerRadius: 16)
        }
    }
}

struct DentView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        isDark: false,
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        DentView()
            .environmentObject(neumorphism)
    }
}
