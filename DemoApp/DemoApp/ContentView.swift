import SwiftUI
import NeumorphismUI

struct ContentView: View {
    @Environment(\.baseColor) var baseColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.baseColor.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text("NeumorphismUI DemoApp")
                            .font(.title)
                            .foregroundColor(self.baseColor.darkerColor())
                        
                        Circle()
                            .fill(self.baseColor)
                            .neumorphismShadow()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        Rectangle()
                            .fill(self.baseColor)
                            .neumorphismShadow()
                            .frame(width: 200, height: 100)
                            .padding()
                        
                        Circle()
                            .stroke(self.baseColor, lineWidth: 16)
                            .neumorphismShadow()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        Circle()
                            .stroke(self.baseColor, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round, dash: [0.1, 12], dashPhase: 16))
                            .neumorphismShadow()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        
                        RoundedRectangle(cornerRadius: 100)
                            .fill(self.baseColor)
                            .neumorphismShadow()
                            .frame(width: 300, height: 100)
                            .padding()
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: nil)
                    
                }
                .background(self.baseColor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.baseColor, Color(hex: "C1D2EB"))
    }
}
