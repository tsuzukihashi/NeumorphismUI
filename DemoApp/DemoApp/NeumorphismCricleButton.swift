import SwiftUI
import NeumorphismUI

struct NeumorphismCricleButton: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State var isSelected = false
    
    var body: some View {
        NeumorphismButton(action: {
            self.isSelected.toggle()
            self.neumorphism.changeMode()
        }) { isHeighlight in
            Image(systemName: self.isSelected ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:60, height: 60)
                .foregroundColor(self.neumorphism.color.darkerColor())
                .background(
                    Circle()
                        .fill(self.neumorphism.color)
                        .frame(width: 100, height: 100)
                        .modifier(NeumorphismShadowModifier(isAnimation: isHeighlight))
                    
            )
                .padding()
                .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
        }
        .padding()
    }
}

struct NeumorphismCricleButton_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
         isDark: false,
         lightColor: Color(hex: "C1D2EB"),
         darkColor: Color(hex: "2C292C")
     )
    static var previews: some View {
        NeumorphismCricleButton()
            .environmentObject(neumorphism)
    }
}
