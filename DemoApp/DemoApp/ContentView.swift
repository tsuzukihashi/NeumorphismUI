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
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(self.neumorphism.color)
                                .neumorphismShadow()
                                .frame(width: 300, height: 64, alignment: .center)
                            
                            Text("NeumorphismUI")
                                .shadow(color: self.neumorphism.color.darkerColor(), radius: 4, x: 4, y: 4)
                                .shadow(color: self.neumorphism.color.lighterColor(), radius: 4, x: -4, y: -4)
                                .foregroundColor(self.neumorphism.color.darkerColor())
                                .font(.system(size: 36, weight: .bold, design: .rounded))
                        }
                        
                        NeumorphismBindingButton(isSelected: $isDark, shapeType: .circle, normalImage: Image(systemName: "sun.max"), selectedImage: Image(systemName: "moon"), width: 44, height: 44, imageWidth: 20, imageHeight: 20, shadowRadius: 4) {
                            self.neumorphism.changeMode()
                        }.onAppear() {
                            self.isDark = self.neumorphism.isDark
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: SimpleView()) {
                        BaseView(name: "SimpleView", desc: "most simple neumorphism")
                    }.padding()
                    
                    NavigationLink(destination: Concave()) {
                        BaseView(name: "Concave", desc: "concave neumorphism")
                    }.padding()
                    
                    NavigationLink(destination: NeumorphismButtonView()) {
                        BaseView(name: "NeumorphismButtonView", desc: "neumorphism button")
                    }.padding()
                    
                    NavigationLink(destination: BindingButtonView()) {
                        BaseView(name: "NeumorphismBindingButton", desc: "neumorphism binding button")
                    }.padding()
                    
                    NavigationLink(destination: NeumorphismSliderView()) {
                        BaseView(name: "NeumorphismSlider", desc: "custom slider")
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
