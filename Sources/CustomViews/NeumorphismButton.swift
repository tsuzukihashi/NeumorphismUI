import SwiftUI

@available(iOS 13.0.0, *)
public struct NeumorphismButton: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State var isSelected = false

    private var normalImage: Image
    private var selectedImage: Image
    private var width: CGFloat
    private var height: CGFloat
    private var imageWidth: CGFloat
    private var imageHeight: CGFloat
    private var handler: (() -> Void)?

    public init
        (
        normalImage: Image = Image(systemName: "heart"),
        selectedImage: Image = Image(systemName: "heart.fill"),
        width: CGFloat = 100,
        height: CGFloat = 100,
        imageWidth: CGFloat = 60,
        imageHeight: CGFloat = 60,
        handler: (() -> Void)? = nil
    ) {
        self.normalImage = normalImage
        self.selectedImage = selectedImage
        self.width = width
        self.height = height
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.handler = handler
    }
    
    public var body: some View {
        HighlightableButton(action: {
            self.isSelected.toggle()
            self.handler?()
        }) { isHeighlight in
            (self.isSelected ? self.selectedImage : self.normalImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:self.imageWidth, height: self.imageWidth)
                .foregroundColor(self.neumorphism.color.darkerColor())
                .background(
                    Circle()
                        .fill(self.neumorphism.color)
                        .frame(width: self.width, height: self.height)
                        .modifier(NeumorphismShadowModifier(isAnimation: isHeighlight))
            )
                .padding()
                .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
        }
        .padding()
    }
}
