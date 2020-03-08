import SwiftUI
import NeumorphismUI

struct ContentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager

    @State var isSelected = false
    @State var isSelectedBox = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.neumorphism.color.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text("NeumorphismUI DemoApp")
                            .font(.title)
                            .foregroundColor(self.neumorphism.color.darkerColor())
                        
                        NeumorphismCricleButton()
                        
                        NeumorphismRoundedRectangleButton()
                        
                        Circle()
                            .fill(self.neumorphism.color)
                            .neumorphismShadow()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        Rectangle()
                            .fill(self.neumorphism.color)
                            .neumorphismShadow()
                            .frame(width: 200, height: 100)
                            .padding()
                        
                        Circle()
                            .stroke(self.neumorphism.color, lineWidth: 16)
                            .neumorphismShadow()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        Circle()
                            .stroke(self.neumorphism.color, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round, dash: [0.1, 12], dashPhase: 16))
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
    static var previews: some View {
        ContentView()
    }
}
