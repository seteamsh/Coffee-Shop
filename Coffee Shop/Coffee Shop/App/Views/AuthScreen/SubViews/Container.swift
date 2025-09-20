import SwiftUI

struct Container: View {
    var action: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            Text("Fall in Love with Coffee in Blissful Delight!")
                .fontSora(size: 32, weight: .semibold, color: .white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            Text("Welcome to our cozy coffee corner, where every cup is a delightful for you.")
                .fontSora(size: 14, weight: .regular, color: .grayLighter)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
            OrangeButton(text: "Get Started", width: 327, height: 56) {
                action()
            }
            .padding(.bottom, 54)
        }
        .padding([.leading, .trailing], 24)
        .background(.black)
    }
}
