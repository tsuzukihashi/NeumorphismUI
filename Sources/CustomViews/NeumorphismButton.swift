import SwiftUI

@available(iOS 13.0, *)
@available(macOS 12.0, *)
public struct NeumorphismButton: View {
  @EnvironmentObject var neumorphism: NeumorphismManager
  @State var isSelected = false

  private var shapeType: ShapeType
  private var normalImage: Image
  private var selectedImage: Image
  private var width: CGFloat?
  private var height: CGFloat?
  private var imageWidth: CGFloat?
  private var imageHeight: CGFloat?
  private var color: Color?
  private var shadowRadius: CGFloat
  private var handler: (() -> Void)?

  public init
  (
    shapeType: ShapeType = .circle,
    normalImage: Image = Image(systemName: "heart"),
    selectedImage: Image = Image(systemName: "heart.fill"),
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    imageWidth: CGFloat? = nil,
    imageHeight: CGFloat? = nil,
    color: Color? = nil,
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
    self.color = color
    self.shadowRadius = shadowRadius
    self.handler = handler
  }

  public var body: some View {
    HighlightableButton(action: {
      isSelected.toggle()
      handler?()
    }) { isHeighlight in
      (isSelected ? selectedImage : normalImage)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width:imageWidth, height: imageWidth)
        .foregroundColor(neumorphism.fontColor())
        .background(
          Rectangle()
            .clipShape(shapeType.anyShape)
            .foregroundColor(color ?? neumorphism.color)
            .frame(width: width, height: height)
            .modifier(
              isSelected
              ? NeumorphismShadowModifier(baseColor: color, radius: shadowRadius, isAnimation: isHeighlight)
              : NeumorphismShadowModifier(baseColor: color, radius: shadowRadius, isAnimation: isHeighlight)
            )
        )
        .padding()
        .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 1))
    }
  }
}

@available(iOS 13.0, *)
@available(macOS 12.0, *)
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
