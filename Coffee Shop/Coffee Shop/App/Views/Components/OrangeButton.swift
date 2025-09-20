import SwiftUI

struct OrangeButton: View {
    let text: String
    let width: CGFloat
    let height: CGFloat
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundColor(.brownNormal)
                    .cornerRadius(16)
                Text(text)
                    .fontSora(size: 16, weight: .semibold, color: .white)
            }
        }
    }
}
