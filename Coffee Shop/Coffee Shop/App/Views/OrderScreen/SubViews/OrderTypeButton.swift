import SwiftUI

struct OrderTypeButton: View {
    var name: String
    var isActive: Bool
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(name)
                .fontSora(
                    size: 16,
                    weight: isActive ? .semibold : .regular,
                    color: isActive ? .white : .grayNormalActive
                )
                .frame(width: 150, height: 34)
                .background(isActive ? .brownNormal : .categoryNotActive)
                .cornerRadius(8)
        }
        .padding(4)
    }
}

#Preview {
    OrderTypeButton(
        name: "Deliver",
        isActive: false,
        action: {}
    )
}
