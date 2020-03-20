import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismDentView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    
    private let width: CGFloat?
    private let height: CGFloat?
    private let cornerRadius: CGFloat

    public init(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        cornerRadius: CGFloat = 16
    ) {
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .fill(self.neumorphism.color)
                .frame(width: self.width, height: self.height)
                .overlay(
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .stroke(self.neumorphism.color, lineWidth: 4)
                        .shadow(color: self.neumorphism.color.darkerColor(), radius: 4, x: 4, y: 4)
                        .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                        .shadow(color: self.neumorphism.color.lighterColor(), radius: 2, x: -2, y: -2)
                        .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
            )
            .cornerRadius(self.cornerRadius)
        }
    }
}

@available(iOS 13.0, *)
struct NeumorphismTextView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    static var previews: some View {
        NeumorphismDentView()
            .environmentObject(neumorphism)
            .previewLayout(.sizeThatFits)
    }
}
