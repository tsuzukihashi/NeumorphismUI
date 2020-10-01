import SwiftUI

@available(iOS 14.0, *)
public struct NeumorphismContent: LibraryContentProvider {
    @LibraryContentBuilder
    public var views: [LibraryItem] {
        LibraryItem(
            NeumorphismDentView(shapeType: .rectangle, width: 300, height: 4, color: nil, cornerRadius: 4),
            title: "Neumorphism Dent View",
            category: .control
        )
        LibraryItem(
            NeumorphismButton(shapeType: .circle, normalImage: Image(systemName: "star"), selectedImage: Image(systemName: "star.fill"), width: 100, height: 100, imageWidth: 44, imageHeight: 44, color: nil, shadowRadius: 8, handler: nil),
            title: "Neumorphism Simple Button sample",
            category: .control
        )
    }

    @LibraryContentBuilder
    public func modifiers(base: AnyView) -> [LibraryItem] {
        LibraryItem(
            base.neumorphismShadow(),
            title: "Neumorphism Simple shadow",
            category: .effect
        )
        LibraryItem(
            base.neumorphismShadow(
                baseColor: nil,
                radius: 8,
                x: 4,
                y: 4,
                isAnimation: true
            ),
            title: "Neumorphism Custom shadow",
            category: .effect
        )
    }
}

