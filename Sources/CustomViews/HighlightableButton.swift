import SwiftUI

@available(iOS 13.0, *)
public struct HighlightableButton<Label>: View where Label: View {
    @State private var isHighlighted = false
    
    private let action: () -> Void
    private let label: (Bool) -> Label
    
    public init(action: @escaping () -> Void, label: @escaping (Bool) -> Label) {
        self.action = action
        self.label = label
    }
    
    public var body: some View {
        label(isHighlighted)
            .gesture(
                DragGesture(minimumDistance: 0.0)
                    .onChanged { _ in
                        withAnimation {
                            self.isHighlighted = true
                        }}
                    .onEnded { value in
                        if abs(value.translation.height) <= 64 {
                            self.action()
                        }
                        withAnimation {
                            self.isHighlighted = false
                        }})
            .animation(Animation.easeIn(duration: 0.05))
    }
}
