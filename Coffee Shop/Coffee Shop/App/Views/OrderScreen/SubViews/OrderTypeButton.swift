import SwiftUI

struct OrderTypeButton: View {
    var name: DeliveryType
    var isActive: Bool
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(name.rawValue)
                .fontSora(
                    size: 16,
                    weight: isActive ? .semibold : .regular,
                    color: isActive ? .white : .grayNormalActive
                )
                .frame(maxWidth: .infinity, maxHeight: 34)
                .background(isActive ? .brownNormal : .categoryNotActive)
                .cornerRadius(8)
        }
        .padding(4)
    }
}

#Preview {
    OrderTypeButton(
        name: .devlier,
        isActive: false,
        action: {}
    )
}
