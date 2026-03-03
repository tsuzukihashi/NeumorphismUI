import XCTest
import SwiftUI
@testable import NeumorphismUI

class ColorExtensiontests: XCTestCase {

  var color: Color!

  override func setUp() {
    color = Color(hex: "010101")
  }

  func test_init() {
    let (r, g, b, a) = color.getRGBA()
    XCTAssertEqual(r, 1.0 / 255.0, accuracy: 0.01)
    XCTAssertEqual(g, 1.0 / 255.0, accuracy: 0.01)
    XCTAssertEqual(b, 1.0 / 255.0, accuracy: 0.01)
    XCTAssertEqual(a, 1.0, accuracy: 0.01)
  }

  func test_getRGBA() {
    let (red, green, blue, alpha) = color.getRGBA()
    XCTAssertEqual(red, 1.0 / 255.0, accuracy: 0.01)
    XCTAssertEqual(green, 1.0 / 255.0, accuracy: 0.01)
    XCTAssertEqual(blue, 1.0 / 255.0, accuracy: 0.01)
    XCTAssertEqual(alpha, 1.0, accuracy: 0.01)
  }

  func test_getHSLA() {
    let (hue, saturation, lightness, alpha) = color.getHSLA()
    XCTAssertEqual(hue, 0.0, accuracy: 0.01)
    XCTAssertEqual(saturation, 0.0, accuracy: 0.01)
    XCTAssertEqual(lightness, 1.0 / 255.0, accuracy: 0.01)
    XCTAssertEqual(alpha, 1.0, accuracy: 0.01)
  }

  // https://uxdesign.cc/neumorphism-in-user-interfaces-b47cef3bf3a6
  func test_lighterColor() {
    let lightColor = color.lighterColor()
    let (r, g, b, _) = lightColor.getRGBA()

    // Original color ~0.004, lightened by +0.12 in lightness
    // Expected roughly 0x20/255 = 0.125
    XCTAssertEqual(r, g, accuracy: 0.01)
    XCTAssertEqual(g, b, accuracy: 0.01)
    XCTAssertGreaterThan(r, 0.1)
    XCTAssertLessThan(r, 0.2)
  }

  func test_darkerColor() {
    color = Color(hex: "E0E5EC")

    let darkerColor = color.darkerColor()
    let (r, g, b, _) = darkerColor.getRGBA()

    // Expected roughly #A1B0C5 → r≈0.63, g≈0.69, b≈0.77
    XCTAssertEqual(r, 0.63, accuracy: 0.05)
    XCTAssertEqual(g, 0.69, accuracy: 0.05)
    XCTAssertEqual(b, 0.77, accuracy: 0.05)
  }
}
