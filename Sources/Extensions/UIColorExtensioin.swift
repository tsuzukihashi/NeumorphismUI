import SwiftUI

#if canImport(UIKit)
@available(iOS 13.0, *)
public extension UIColor {
    var color: Color {
        Color(self)
    }
}
#endif

#if canImport(AppKit)
@available(macOS 12.0, *)
public extension NSColor {
  var color: Color {
    Color(nsColor: self)
  }
}
#endif
