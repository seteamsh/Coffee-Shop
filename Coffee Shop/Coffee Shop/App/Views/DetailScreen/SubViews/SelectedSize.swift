

import SwiftUI

struct SelectedSize: View {
    @ObservedObject var model: DetailScreenViewModel
    @EnvironmentObject var orderViewModel: OrderViewModel
    var body: some View {
        Text("Size")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
        HStack(spacing: 16) {
            SelectedSizeButton(isActive: orderViewModel.getSize() == .S,
                         size: .S) {
                orderViewModel.setSize(.S)
            }
            SelectedSizeButton(isActive: orderViewModel.getSize() == .M,
                         size: .M) {
                orderViewModel.setSize(.M)
            }
            SelectedSizeButton(isActive: orderViewModel.getSize() == .L,
                         size: .L) {
                orderViewModel.setSize(.L)
            }
        }
    }
}

#Preview {
    SelectedSize(model: DetailScreenViewModel())
        .environmentObject(OrderViewModel())
}
