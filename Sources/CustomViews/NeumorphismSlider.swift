import SwiftUI

@available(iOS 13.0, *)
@available(macOS 12.0, *)
public struct NeumorphismSlider: View {
  @EnvironmentObject var neumorphism: NeumorphismManager
  @Binding var sliderValue: Double

  var changeHandler: (() -> Void)?
  var endedHandler: (() -> Void)?

  private var tipColor: Color?
  private let barColor: Color?
  private let height: CGFloat
  private let width: CGFloat
  private var showPointer: Bool

  public init(
    width: CGFloat = 300,
    height: CGFloat = 16,
    tipColor: Color? = nil,
    barColor: Color? = nil,
    showPointer: Bool = false,
    value: Binding<Double>,
    changeHandler: (() -> Void)? = nil,
    endedHandler: (() -> Void)? =  nil
  ) {
    self.height = height
    self.width = width
    self.tipColor = tipColor
    self.barColor = barColor
    self.showPointer = showPointer
    self._sliderValue = value
    self.changeHandler = changeHandler
    self.endedHandler = endedHandler
    validate()
  }

  public var body: some View {
    ZStack(alignment: .leading) {
      NeumorphismDentView(
        width: width,
        height: height
      )

      ZStack(alignment: .trailing) {
        RoundedRectangle(cornerRadius: height / 2)
          .fill(barColor ?? neumorphism.color.darkerColor())
          .frame(
            width: width * CGFloat(sliderValue),
            height: height * 0.8,
            alignment: .leading)
          .padding(.init(top: 8, leading: 2, bottom: 8, trailing: 2))
        if showPointer {
          ZStack {
            Circle()
              .fill(neumorphism.color)
              .frame(width: height * 1.5, height: height * 1.5)
              .shadow(color: neumorphism.color.darkerColor(), radius: 4, x: 0, y: 0)
          }
        }
      }
    }.gesture(
      DragGesture(minimumDistance: 0)
        .onChanged({ (value) in
          sliderValue = Double(value.location.x / width)
          validate()
          changeHandler?()
        })
        .onEnded({ (value) in
          sliderValue = Double(value.location.x / width)
          validate()
          endedHandler?()
        })
    )
  }

  private func validate() {
    if sliderValue > 1.0 {
      DispatchQueue.main.async {
        sliderValue = 1.0
      }
    }
    if sliderValue < 0 {
      DispatchQueue.main.async {
        sliderValue = 0
      }
    }
  }
}

@available(iOS 13.0, *)
@available(macOS 12.0, *)
public struct NeumorphismSlider_Previews: PreviewProvider {
  static let neumorphism = NeumorphismManager(
    lightColor: Color(hex: "C1D2EB"),
    darkColor: Color(hex: "2C292C")
  )
  public static var previews: some View {
    NeumorphismSlider(
      width: 300,
      height: 16,
      value: .constant(0.5))
    .environmentObject(neumorphism)
    .previewLayout(.sizeThatFits)
  }
}
