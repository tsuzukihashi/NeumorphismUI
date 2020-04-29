import SwiftUI
import NeumorphismUI

struct Concave: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                Rectangle()
                    .fill(neumorphism.color)
                    .neumorphismConcave(shapeType: .rectangle, color: nil)
                    .frame(width: 256, height: 100)
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(neumorphism.color)
                    .neumorphismConcave(shapeType: .roundedRectangle(cornerRadius: 16), color: nil)
                    .frame(width: 256, height: 100)
                
                Circle()
                    .fill(neumorphism.color)
                    .neumorphismConcave(shapeType: .circle, color: nil)
                    .frame(width: 150, height: 150)
                
                Ellipse()
                    .fill(neumorphism.color)
                    .neumorphismConcave(shapeType: .ellipse, color: nil)
                    .frame(width: 300, height: 100)
                
                Capsule(style: .circular)
                    .fill(neumorphism.color)
                    .neumorphismConcave(shapeType: .capsule, color: nil)
                    .frame(width: 300, height: 100)
            }
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
        Concave()
            .environmentObject(neumorphism)
    }
}
