import XCTest
import SwiftUI
@testable import NeumorphismUI

class NeumorphismManagerTests: XCTestCase {
    
    var mock: NeumorphismManagerMock!
    
    override func setUp() {
        mock = NeumorphismManagerMock()
    }
    
    func test_changeMode() {
        mock.changeMode()
        
        XCTAssertEqual(mock.changeModeCallCount, 1)
    }
}
