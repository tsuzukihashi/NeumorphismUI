import SwiftUI

@available(iOS 13.0, *)
public struct AnyShape: Shape {
    public init<S: Shape>(_ wrapped: S) {
        _path = { rect in
            let path = wrapped.path(in: rect)
            return path
        }
    }

    public func path(in rect: CGRect) -> Path {
        return _path(rect)
    }
    
    private let _path: (CGRect) -> Path
}
