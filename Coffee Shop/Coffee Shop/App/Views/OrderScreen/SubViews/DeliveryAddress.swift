import SwiftUI

struct DeliveryAddress: View {
    @ObservedObject var model: OrderScreenViewModel
    var body: some View {
        Text("Delivery Address")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
        Text("Jl. Kpg Sutoyo")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
        Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.")
            .fontSora(size: 12, weight: .regular, color: .grayLighter)
        HStack(spacing: 8) {
            EditButton(editType: .edit)
            EditButton(editType: .note)
        }
    }
}

#Preview {
    DeliveryAddress(model: OrderScreenViewModel())
}
