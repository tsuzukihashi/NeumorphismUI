import SwiftUI

#if canImport(UIKit)
public extension UIColor {
  var color: Color {
    Color(self)
  }
}
#endif

#if canImport(AppKit)
public extension NSColor {
  var color: Color {
    Color(nsColor: self)
  }
}
#endif
