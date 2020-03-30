import SwiftUI

@available(iOS 13.0, *)
public struct NeumorphismSlider: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @Binding var value: Double
    private var tipColor: Color?
    private let barColor: Color?
    private let height: CGFloat
    private let width: CGFloat
    
    public init(
        width: CGFloat = 300,
        height: CGFloat = 16,
        tipColor: Color? = nil,
        barColor: Color? = nil,
        value: Binding<Double>
    ) {
        self.height = height
        self.width = width
        self.tipColor = tipColor
        self.barColor = barColor
        self._value = value
        
        validate()
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            NeumorphismDentView(
                width: width,
                height: height,
                cornerRadius: self.height / 2
            )
            
            ZStack (alignment: .trailing){
                RoundedRectangle(cornerRadius: self.height / 2)
                    .fill(
                        LinearGradient(gradient:
                            Gradient(colors:
                                [barColor ?? self.neumorphism.color.darkerColor(),
                                 barColor?.darkerColor() ?? self.neumorphism.color.darkerColor().darkerColor()]),
                                       startPoint: .leading,
                                       endPoint: .trailing))
                    .frame(
                        width: self.width * CGFloat(value),
                        height: height * 0.9,
                        alignment: .leading)
                    .padding(.leading, 4)
                HStack {
                    ZStack {
                        Circle()
                            .fill(self.neumorphism.color)
                            .frame(width: height * 2, height: height * 2)
                            .neumorphismShadow()
                        
                    NeumorphismDentView(
                        width: height * 0.8,
                        height: height * 0.8,
                        color: tipColor ?? self.neumorphism.color.darkerColor(),
                        cornerRadius: height/2)
                    }
                }
            }
        }.gesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ (value) in
                    self.value = Double(value.location.x / self.width)
                    self.validate()
                })
                .onEnded({ (value) in
                    self.value = Double(value.location.x / self.width)
                    self.validate()
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
            value: .constant(0.4))
            .environmentObject(neumorphism)
            .previewLayout(.sizeThatFits)
    }
}
