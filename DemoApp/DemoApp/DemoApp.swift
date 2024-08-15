import SwiftUI
import NeumorphismUI

@main
struct DemoApp: App {
  let neumorphism = NeumorphismManager(
      lightColor: Color(hex: "C1D2EB"),
      darkColor: Color(hex: "2C292C")
  )

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(neumorphism)
    }
  }
}
