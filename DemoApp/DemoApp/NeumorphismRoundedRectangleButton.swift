import SwiftUI
import NeumorphismUI

struct NeumorphismRoundedRectangleButton: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State var isSelectedBox = false
    
    var body: some View {
        NeumorphismButton(action: {
            self.isSelectedBox.toggle()
        }) { isHeighlight in
            Image(systemName: self.isSelectedBox ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:60, height: 60)
                .foregroundColor(self.neumorphism.color.darkerColor())
                .background(
                    RoundedRectangle(cornerRadius: 20)
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

struct NeumorphismRoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismRoundedRectangleButton()
    }
}
