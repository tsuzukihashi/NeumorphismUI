import SwiftUI

@available(iOS 13.0, *)
@available(OSX 10.15, *)
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
    
    func uiColor() -> UIColor {
        let (r, g, b, a) = getRGBA()
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    }
    
    func getRGBA() -> (r: Double, g: Double, b: Double, a: Double) {
        let str = String(self.description.dropFirst())
        let value = Int(str, radix: 16) ?? 0
        let r = Double(value / Int(powf(256, 3)) % 256) / 255
        let g = Double(value / Int(powf(256, 2)) % 256) / 255
        let b = Double(value / Int(powf(256, 1)) % 256) / 255
        let a = Double(value / Int(powf(256, 0)) % 256) / 255
        return (r, g, b, a)
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
