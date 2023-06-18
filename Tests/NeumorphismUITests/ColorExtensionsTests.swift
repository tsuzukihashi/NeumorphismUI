import XCTest
import SwiftUI
@testable import NeumorphismUI

@available(iOS 13.0, *)
@available(macOS 12.0, *)
class ColorExtensiontests: XCTestCase {

  var color: Color!

  override func setUp() {
    color = Color(hex: "010101")
  }

  func test_init() {
    XCTAssertEqual(color.description.dropFirst(), "010101FF")
  }

  func test_getRGBA() {
    let (red, green, blue, alpha) = color.getRGBA()
    XCTAssertEqual(red, 0.00392156862745098)
    XCTAssertEqual(green, 0.00392156862745098)
    XCTAssertEqual(blue, 0.00392156862745098)
    XCTAssertEqual(alpha, 1.0)
  }

  func test_getHSLA() {
    let (hue, saturation, lightness, alpha) = color.getHSLA()
    XCTAssertEqual(hue, 0.0)
    XCTAssertEqual(saturation, 0.0)
    XCTAssertEqual(lightness, 0.00392156862745098)
    XCTAssertEqual(alpha, 1.0)
  }

  // https://uxdesign.cc/neumorphism-in-user-interfaces-b47cef3bf3a6
  func test_lighterColor() {
    let lightColor = color.lighterColor()

    XCTAssertEqual(lightColor.description.dropFirst(), "202020FF")
  }

  func test_darkerColor() {
    color = Color(hex: "E0E5EC")

    let darkerColor = color.darkerColor()

    XCTAssertEqual(darkerColor.description.dropFirst(), "A1B0C5FF")
  }
}
