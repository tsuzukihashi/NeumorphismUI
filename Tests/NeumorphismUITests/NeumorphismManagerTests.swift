import XCTest
import SwiftUI
@testable import NeumorphismUI

@available(iOS 13.0, *)
class NeumorphismManagerTests: XCTestCase {
    
    var mock: NeumorphismManagerMock!
    
    override func setUp() {
        mock = NeumorphismManagerMock()
    }
    
    func test_changeMode() {
        mock.changeMode()
        
        XCTAssertEqual(mock.changeModeCallCount, 1)
    }
    
    func test_fontColor() {
        mock.isDark = true
        var color = mock.fontColor()
        
        XCTAssertEqual(color, Color.white)
        
        mock.isDark = false
        color = mock.fontColor()
        
        XCTAssertEqual(color, Color.black)
    }
}
