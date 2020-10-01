import SwiftUI
import NeumorphismUI

struct BaseView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    var name: String = "SimpleView"
    var desc: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(self.neumorphism.color)
                .neumorphismShadow()
            HStack {
                VStack (alignment: .leading){
                    Text(name)
                        .foregroundColor(self.neumorphism.fontColor())
                        .font(.headline)
                    Text(desc)
                        .foregroundColor(self.neumorphism.fontColor())
                        .font(.subheadline)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(self.neumorphism.fontColor())
                    .padding(.trailing, 24)
            }
            .frame(width: nil, height: 80)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        BaseView()
            .environmentObject(neumorphism )
    }
}
