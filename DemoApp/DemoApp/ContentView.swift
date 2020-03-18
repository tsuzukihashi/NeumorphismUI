import SwiftUI
import NeumorphismUI

struct ContentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State private var showView: Bool = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (spacing: 0){
                    Text("NeumorphismUI")
                        .foregroundColor(self.neumorphism.fontColor())
                        .font(.title)
                    
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
                    
                    Spacer()
                }
            }.background(self.neumorphism.color.edgesIgnoringSafeArea(.all))
        }
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
