import SwiftUI

@available(iOS 13.0.0, *)
public struct NeumorphismCricleButton: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State var isSelected = false
    
    private var width: CGFloat
    private var height: CGFloat
    private var handler: (() -> Void)?

    public init(width: CGFloat = 100, height: CGFloat = 100, handler: (() -> Void)? = nil) {
        self.width = width
        self.height = height
        self.handler = handler
    }
    
    public var body: some View {
        HighlightableButton(action: {
            self.isSelected.toggle()
            self.handler?()
        }) { isHeighlight in
            Image(systemName: self.isSelected ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:60, height: 60)
                .foregroundColor(self.neumorphism.color.darkerColor())
                .background(
                    Circle()
                        .fill(self.neumorphism.color)
                        .frame(width: 100, height: 100)
                        .modifier(NeumorphismShadowModifier(isAnimation: isHeighlight))
                    
            )
                .padding()
                .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
        }
        .padding()
    }
}
