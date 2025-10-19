

import SwiftUI

struct SelectedSize: View {
    @ObservedObject var model: DetailScreenViewModel
    @EnvironmentObject var orderModel: OrderViewModel
    var body: some View {
        Text("Size")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
        HStack(spacing: 16) {
            SelectedSizeButton(isActive: model.selectedSize == .S,
                         size: .S) {
                model.selectedSize = .S
                orderModel.size = .S
            }
            SelectedSizeButton(isActive: model.selectedSize == .M,
                         size: .M) {
                model.selectedSize = .M
                orderModel.size = .M
            }
            SelectedSizeButton(isActive: model.selectedSize == .L,
                         size: .L) {
                model.selectedSize = .L
                orderModel.size = .L
            }
        }
    }
}

#Preview {
    SelectedSize(model: DetailScreenViewModel())
        .environmentObject(OrderViewModel())
}
