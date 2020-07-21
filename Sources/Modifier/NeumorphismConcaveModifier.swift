import SwiftUI

@available(iOS 13.0, *)
struct NeumorphismConcaveModifier: ViewModifier {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    private var shapeType: ShapeType
    private let color: Color?
    
    init(shapeType: ShapeType = .circle, color: Color? = nil) {
        self.shapeType = shapeType
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                shapeType.anyShape
                    .stroke(color ?? neumorphism.color, lineWidth: 4)
                    .shadow(color: color?.darkerColor() ?? neumorphism.color.darkerColor(),
                            radius: 4, x: 4, y: 4)
                    .shadow(color: color?.lighterColor() ?? neumorphism.color.lighterColor(),
                            radius: 4, x: -4, y: -4))
            .clipShape(shapeType.anyShape)
    }
}

struct NeumorphismConcaveModifier_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        ZStack {
            neumorphism.color
            Circle()
                .fill(neumorphism.color)
                .frame(width: 100, height: 100)
                .modifier(NeumorphismConcaveModifier(shapeType: .circle))
                .environmentObject(neumorphism)
                .padding()
        }
        .frame(width: 100, height: 100)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
