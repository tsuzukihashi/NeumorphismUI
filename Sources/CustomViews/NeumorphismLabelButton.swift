import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismLabelButton: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State var isSelected = false
    private var text: String
    private var font: Font?
    private var color: Color?
    private var width: CGFloat?
    private var height: CGFloat?
    private var cornerRadius: CGFloat
    private var handler: (() -> Void)?
    
    public init
        (
        text: String = "Button",
        font: Font? = nil,
        color: Color? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        cornerRadius: CGFloat = 10,
        handler: (() -> Void)? = nil
    ) {
        self.text = text
        self.font = font
        self.color = color
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.handler = handler
    }
    
    public var body: some View {
        HighlightableButton(action: {
            self.isSelected.toggle()
            self.handler?()
        }) { isHeighlight in
            ZStack {
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(self.neumorphism.color)
                    .frame(width: self.width, height: self.height)
                    .modifier(NeumorphismShadowModifier(isAnimation: isHeighlight))
                    .padding()

                
                Text(self.text)
                    .font(self.font ?? .title)
                    .foregroundColor(
                        isHeighlight ? self.color?.darkerColor() ?? self.neumorphism.fontColor() : self.color ?? self.neumorphism.fontColor())
            }
            .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
        }
    }
}

@available(iOS 13.0, *)
struct NeumorphismLabelButton_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    
    static var previews: some View {
        NeumorphismLabelButton()
            .environmentObject(neumorphism)
            .previewLayout(.sizeThatFits)
    }
}
