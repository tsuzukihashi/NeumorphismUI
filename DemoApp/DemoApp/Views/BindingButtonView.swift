import SwiftUI
import NeumorphismUI

struct BindingButtonView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State var isDark = false
    
    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            NeumorphismBindingButton(
                isSelected: $isDark,
                shapeType: .roundedRectangle(cornerRadius: 80),
                normalImage: Image(systemName: "book"),
                selectedImage: Image(systemName: "book.fill"),
                width: 300,
                height: 300,
                imageWidth: 180,
                imageHeight: 180,
                shadowRadius: 4
            ) {
                self.neumorphism.changeMode()
            }
        }.onAppear() {
            self.isDark = self.neumorphism.isDark
        }
    }
}

struct BindingButtonView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        isDark: false,
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        BindingButtonView()
        .environmentObject(neumorphism)
    }
}
