import SwiftUI

public struct BaseColor: EnvironmentKey {
    @available(iOS 13.0, *)
    public static let defaultValue: Color = Color("EFEEEE")
}

@available(iOS 13.0, *)
public extension EnvironmentValues {
    var baseColor: Color {
        get { self[BaseColor.self] }
        set { self[BaseColor.self] = newValue }
    }
}
