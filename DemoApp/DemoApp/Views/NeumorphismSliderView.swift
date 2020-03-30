import SwiftUI
import NeumorphismUI

struct NeumorphismSliderView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State private var value: Double = 0
    
    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            VStack {
                Text("VALUE: \(value)")
                    .foregroundColor(self.neumorphism.fontColor())
                
                NeumorphismSlider(
                    tipColor: neumorphism.color.darkerColor().darkerColor(),
                    barColor: nil,
                    value: $value
                )
            }
        }
    }
}

struct NeumorphismSliderView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismSliderView()
    }
}
