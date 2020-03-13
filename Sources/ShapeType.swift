import SwiftUI

public enum ShapeType {
    case rectangle
    case roundedRectangle(cornerRadius: CGFloat)
    case capsule
    case ellipse
    case circle
}

@available(iOS 13.0.0, *)
public func getAnyShape(type: ShapeType) -> AnyShape {
    switch type {
    case .rectangle:
        return AnyShape(Rectangle())
    case .roundedRectangle(let cornerRadius):
        return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
    case .capsule:
        return AnyShape(Capsule(style: .circular))
    case .ellipse:
        return AnyShape(Ellipse())
    case .circle:
        return AnyShape(Circle())
    }
}
