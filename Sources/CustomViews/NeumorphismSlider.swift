import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismSlider: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @Binding var value: Double
    
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
        self._value = value
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
                RoundedRectangle(cornerRadius: self.height / 2)
                    .fill(barColor ?? self.neumorphism.color.darkerColor())
                    .frame(
                        width: self.width * CGFloat(value),
                        height: height * 0.8,
                        alignment: .leading)
                    .padding(.init(top: 8, leading: 2, bottom: 8, trailing: 2))
                if self.showPointer {
                    ZStack {
                        Circle()
                            .fill(self.neumorphism.color)
                            .frame(width: self.height * 1.5, height: self.height * 1.5)
                            .shadow(color: self.neumorphism.color.darkerColor(), radius: 4, x: 0, y: 0)
                    }
                }
            }
        }.gesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ (value) in
                    self.value = Double(value.location.x / self.width)
                    self.validate()
                    self.changeHandler?()
                })
                .onEnded({ (value) in
                    self.value = Double(value.location.x / self.width)
                    self.validate()
                    self.endedHandler?()
                })
        )
    }
    
    private func validate() {
        if self.value > 1.0 {
            DispatchQueue.main.async {
                self.value = 1.0
            }
        }
        if self.value < 0 {
            DispatchQueue.main.async {
                self.value = 0
            }
        }
    }
}

@available(iOS 13.0, *)
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
