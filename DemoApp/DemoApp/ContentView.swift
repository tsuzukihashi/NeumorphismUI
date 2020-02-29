import SwiftUI
import NeumorphismUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(hex: "C1D2EB")
                .edgesIgnoringSafeArea(.all)
            Text("Hello, NeumorphismUI!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
