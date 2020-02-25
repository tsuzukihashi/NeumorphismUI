import XCTest
import SwiftUI
@testable import NeumorphismUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
final class NeumorphismUITests: XCTestCase {
    var color: Color!
    
    override func setUp() {
        color = Color(hex: "000000")
    }
    
    func test_init() {
        XCTAssertEqual(color.description.dropFirst(), "000000FF")
    }
    
    func test_getRGBA() {
        let (red, green, blue, alpha) = color.getRGBA()
        XCTAssertEqual(red, 0.0)
        XCTAssertEqual(green, 0.0)
        XCTAssertEqual(blue, 0.0)
        XCTAssertEqual(alpha, 1.0)
    }
}
