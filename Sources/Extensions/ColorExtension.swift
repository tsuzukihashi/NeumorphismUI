import SwiftUI

public extension Color {

  init(
    hue: Double,
    saturation: Double,
    lightness: Double,
    opacity: Double = 1
  ) {
    let (h, s, b) = ColorTransformer.hslToHsb(h: hue, s: saturation, l: lightness)
    self = Color(hue: h, saturation: s, brightness: b, opacity: opacity)
  }

  init(hex: String, opacity: Double = 1.0) {
    let v = Int(hex, radix: 16) ?? 0
    let r = Double(v / Int(powf(256, 2)) % 256) / 255
    let g = Double(v / Int(powf(256, 1)) % 256) / 255
    let b = Double(v / Int(powf(256, 0)) % 256) / 255
    self = Color(red: r, green: g, blue: b, opacity: opacity)
  }

#if canImport(UIKit)
  func uiColor() -> UIColor {
    UIColor(self)
  }
#endif

#if canImport(AppKit)
  func nsColor() -> NSColor {
    NSColor(self)
  }
#endif

  func getRGBA() -> (r: Double, g: Double, b: Double, a: Double) {
#if canImport(UIKit)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return (Double(red), Double(green), Double(blue), Double(alpha))
#elseif canImport(AppKit)
    let nsColor = NSColor(self).usingColorSpace(.sRGB) ?? NSColor(self)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    nsColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return (Double(red), Double(green), Double(blue), Double(alpha))
#endif
  }

  func getHSLA() -> (h: Double, s: Double, l: Double, a: Double) {
    let (r, g, b, a) = getRGBA()
    let (h, s, l) = ColorTransformer.rgbToHsl(r: r, g: g, b: b)
    return (h, s, l, a)
  }

  func lighterColor() -> Color {
    let (h, s, l, a) = getHSLA()
    return Color(hue: h, saturation: s, lightness: min(l + 0.12, 1), opacity: a)
  }

  func darkerColor() -> Color {
    let (h, s, l, a) = getHSLA()
    return  Color(hue: h, saturation: s, lightness: max(l - 0.199, 0), opacity: a)
  }
}
