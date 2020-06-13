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
                
                NeumorphismSlider(showPointer: true, value: self.$value, changeHandler: {
                    // call change method
                }) {
                    // call ended method
                }
                
                NeumorphismSlider(value: self.$value, changeHandler: {
                    // call change method
                }) {
                    // call ended method
                }
            }
        }
    }
}

struct NeumorphismSliderView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismSliderView()
            .previewLayout(.sizeThatFits)
    }
}
