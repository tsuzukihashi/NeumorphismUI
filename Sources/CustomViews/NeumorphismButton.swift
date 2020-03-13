import SwiftUI

@available(iOS 13.0.0, *)
public struct NeumorphismButton: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State var isSelected = false
    
    private var shapeType: ShapeType
    private var normalImage: Image
    private var selectedImage: Image
    private var width: CGFloat
    private var height: CGFloat
    private var imageWidth: CGFloat
    private var imageHeight: CGFloat
    private var shadowRadius: CGFloat
    private var handler: (() -> Void)?
    
    public init
        (
        shapeType: ShapeType = .circle,
        normalImage: Image = Image(systemName: "heart"),
        selectedImage: Image = Image(systemName: "heart.fill"),
        width: CGFloat = 100,
        height: CGFloat = 100,
        imageWidth: CGFloat = 60,
        imageHeight: CGFloat = 60,
        shadowRadius: CGFloat = 8,
        handler: (() -> Void)? = nil
    ) {
        self.shapeType = shapeType
        self.normalImage = normalImage
        self.selectedImage = selectedImage
        self.width = width
        self.height = height
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.shadowRadius = shadowRadius
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
                .foregroundColor(self.neumorphism.fontColor())
                .background(
                    Rectangle()
                        .clipShape(getAnyShape(type: self.shapeType))
                        .foregroundColor(self.neumorphism.color)
                        .frame(width: self.width, height: self.height)
                        .modifier(NeumorphismShadowModifier(radius: self.shadowRadius, isAnimation: isHeighlight))
            )
                .padding()
                .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
        }
    }
}

@available(iOS 13.0.0, *)
struct ContentView_Previews: PreviewProvider {
    static let neumorphism = NeumorphismManager(
        lightColor: Color(hex: "C1D2EB"),
        darkColor: Color(hex: "2C292C")
    )
    
    static var previews: some View {
        NeumorphismButton()
            .environmentObject(neumorphism)
            .previewLayout(.sizeThatFits)
    }
}
