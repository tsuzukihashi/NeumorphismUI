
class NeumorphismManagerMock: NeumorphismManagable {
    var changeModeCallCount = 0
    func changeMode() {
        changeModeCallCount += 1
    }
}
