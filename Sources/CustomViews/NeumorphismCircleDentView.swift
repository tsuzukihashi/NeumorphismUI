import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismCircleDentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    private let width: CGFloat?
    private let height: CGFloat?
    
    public init(
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        Circle()
            .fill(self.neumorphism.color)
            .frame(width: self.width, height: self.height)
            .overlay(
                Circle()
                    .stroke(self.neumorphism.color, lineWidth: 4)
                    .shadow(color: self.neumorphism.color.darkerColor(), radius: 4, x: 4, y: 4)
                    .clipShape(Circle())
                    .shadow(color: self.neumorphism.color.lighterColor(), radius: 2, x: -2, y: -2)
                    .clipShape(Circle())
        )
    }
}

@available(iOS 13.0, *)
struct NeumorphismCircleDentView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        NeumorphismCircleDentView()
            .environmentObject(neumorphism)
            .previewLayout(.sizeThatFits)
    }
}
