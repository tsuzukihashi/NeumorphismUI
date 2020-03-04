import SwiftUI
import NeumorphismUI

struct ContentView: View {
    @Environment(\.baseColor) var baseColor: Color
    @State var isSelected = false
    @State var isSelectedBox = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.baseColor.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                        
                        Text("NeumorphismUI DemoApp")
                            .font(.title)
                            .foregroundColor(self.baseColor.darkerColor())
                        
                        NeumorphismButton(action: {
                            self.isSelected.toggle()
                        }) { isHeighlight in
                            Image(systemName: self.isSelected ? "heart.fill" : "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:60, height: 60)
                                .foregroundColor(self.baseColor.darkerColor())
                                .background(
                                    Circle()
                                        .fill(self.baseColor)
                                        .frame(width: 100, height: 100)
                                        .modifier(NeumorphismShadowModifier(isAnimation: isHeighlight))
                                    
                            )
                                .padding()
                                .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
                        }
                        .padding()
                        
                        NeumorphismButton(action: {
                            self.isSelectedBox.toggle()
                        }) { isHeighlight in
                            
                            Image(systemName: self.isSelectedBox ? "heart.fill" : "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:60, height: 60)
                                .foregroundColor(self.baseColor.darkerColor())
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(self.baseColor)
                                        .frame(width: 100, height: 100)
                                        .modifier(NeumorphismShadowModifier(isAnimation: isHeighlight))
                            )
                                .padding()
                                .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
                            
                        }
                        .padding()
                        
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
