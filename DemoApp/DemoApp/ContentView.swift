import SwiftUI
import NeumorphismUI

struct ContentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State private var showView: Bool = false
    @State var isDark = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (spacing: 0){
                    HStack {
                        Text("NeumorphismUI")
                            .foregroundColor(self.neumorphism.fontColor())
                            .font(.title)
                        
                        NeumorphismBindingButton(isSelected: $isDark, shapeType: .circle, normalImage: Image(systemName: "sun.max"), selectedImage: Image(systemName: "moon"), width: 44, height: 44, imageWidth: 20, imageHeight: 20, shadowRadius: 4) {
                            self.neumorphism.changeMode()
                        }.onAppear() {
                            self.isDark = self.neumorphism.isDark
                        }
                    }
                    NeumorphismDentView(width: 300, height: 8, cornerRadius: 4)
                    
                    NavigationLink(destination: SimpleView()) {
                        BaseView(name: "SimpleView", desc: "most simple neumorphism")
                    }.padding()
                    
                    NavigationLink(destination: DentView()) {
                        BaseView(name: "DentView", desc: "dent neumorphism")
                    }.padding()
                    
                    NavigationLink(destination: NeumorphismButtonView()) {
                        BaseView(name: "NeumorphismButtonView", desc: "neumorphism button")
                    }.padding()
                    
                    NavigationLink(destination: BindingButtonView()) {
                        BaseView(name: "NeumorphismBindingButton", desc: "neumorphism binding button")
                    }.padding()
                    
                    Spacer()
                }
            }.background(self.neumorphism.color.edgesIgnoringSafeArea(.all))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        isDark: false,
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "131A20")
    )
    
    static var previews: some View {
        ContentView()
            .environmentObject(neumorphism)
    }
}
