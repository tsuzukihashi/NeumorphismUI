import SwiftUI

@available(iOS 13.0, *)
@available(OSX 10.15, *)
public extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let v = Int(hex, radix: 16) ?? 0
        let r = Double(v / Int(powf(256, 2)) % 256) / 255
        let g = Double(v / Int(powf(256, 1)) % 256) / 255
        let b = Double(v / Int(powf(256, 0)) % 256) / 255
        self = Color(red: r, green: g, blue: b, opacity: opacity)
    }
    
    func getRGBA() -> (r: Double, g: Double, b: Double, a: Double) {
        let string = String(self.description.dropFirst())
        let v = Int(string, radix: 16) ?? 0
        
        let r = Double(v / Int(powf(256, 3)) % 256) / 255
        let g = Double(v / Int(powf(256, 2)) % 256) / 255
        let b = Double(v / Int(powf(256, 1)) % 256) / 255
        let a = Double(v / Int(powf(256, 0)) % 256) / 255
        
        return (r, g, b, a)
    }
}
