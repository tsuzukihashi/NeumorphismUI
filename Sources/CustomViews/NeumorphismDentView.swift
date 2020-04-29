import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismDentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    private var shapeType: ShapeType
    private let width: CGFloat?
    private let height: CGFloat?
    private let color: Color?
    private let cornerRadius: CGFloat

    public init(
        shapeType: ShapeType = .roundedRectangle(cornerRadius: 16),
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        color: Color? = nil,
        cornerRadius: CGFloat = 16
    ) {
        self.shapeType = shapeType
        self.width = width
        self.height = height
        self.color = color
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        Rectangle()
            .fill(self.color ?? self.neumorphism.color)
            .frame(width: self.width, height: self.height)
            .neumorphismConcave(shapeType: shapeType, color: color)
    }
}

@available(iOS 13.0, *)
struct NeumorphismTextView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        ZStack {
            neumorphism.color
            NeumorphismDentView()
                .frame(width: 100, height: 100)
                .environmentObject(neumorphism)
                .padding()
        }
        .frame(width: 100, height: 100)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
