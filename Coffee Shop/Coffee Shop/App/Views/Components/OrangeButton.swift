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
            Text(text)
                .fontSora(size: 16, weight: .semibold, color: .white)
            
                .frame(maxWidth: width,  maxHeight: height)
                .background(.brownNormal)
                .cornerRadius(16)
        }
    }
}

#Preview {
    OrangeButton(text: "fdg", width: 140, height: 56, action: {})
}
