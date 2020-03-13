import SwiftUI
import NeumorphismUI

struct ContentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State private var isSelected: Bool = false
    @State private var isManager: Bool = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.neumorphism.color.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack (spacing: 0){
                            
                            Text("NeumorphismUI DemoApp")
                                .font(.title)
                                .foregroundColor(self.neumorphism.fontColor())
                            
                            RoundedRectangle(cornerRadius: 1)
                                .fill(self.neumorphism.color.darkerColor())
                                .frame(width: 365, height: 1)
                            
                            NeumorphismBindingButton(isSelected: self.$isSelected, shapeType: .circle, normalImage: Image(systemName: "book"), selectedImage: Image(systemName: "book.fill"), width: 48, height: 48, imageWidth: 24, imageHeight: 24, shadowRadius: 4) {
                                
                            }
                            .padding()
                        }
                        HStack {
                            NeumorphismButton(shapeType: .circle) {
                                self.neumorphism.changeMode()
                            }
                            .padding()
                            
                            NeumorphismButton(shapeType: .roundedRectangle(cornerRadius: 20), normalImage: Image(systemName: "star"), selectedImage: Image(systemName: "star.fill"))
                                .padding()
                            
                            Circle()
                                .fill(self.neumorphism.color)
                                .neumorphismShadow()
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        
                        HStack {
                            Button(action: {
                                self.isManager.toggle()
                            }) {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(self.neumorphism.color)
                                    .neumorphismShadow()
                                    .frame(width: 100, height: 80)
                            }
                            
                            NeumorphismDentView(width: 100, height: 80, cornerRadius: 16)
                            
                            
                        }
                        
                        Circle()
                            .stroke(self.neumorphism.color, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round, dash: [8, 24], dashPhase: 16))
                            .neumorphismShadow()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        RoundedRectangle(cornerRadius: 100)
                            .fill(self.neumorphism.color)
                            .neumorphismShadow()
                            .frame(width: 300, height: 100)
                            .padding()
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: nil)
                }
                .background(self.neumorphism.color)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        isDark: true,
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "131A20")
    )
    
    static var previews: some View {
        ContentView()
            .environmentObject(neumorphism)
    }
}
