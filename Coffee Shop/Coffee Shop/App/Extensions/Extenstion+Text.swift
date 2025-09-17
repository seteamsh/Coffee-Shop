import SwiftUI

extension Text {
    func fontSora(size: CGFloat, weight: Font.Weight?, color: Color) -> some View {
        self
            .font(Font.custom(.sora, size: size))
            .fontWeight(weight)
            .foregroundStyle(color)
    }
}
