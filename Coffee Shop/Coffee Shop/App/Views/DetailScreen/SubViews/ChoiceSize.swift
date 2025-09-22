

import SwiftUI

struct ChoiceSize: View {
    @ObservedObject var model: DetailScreenModel
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        Text("Size")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
        HStack(spacing: 0) {
            ForEach(model.sizes) { size in
                ChoiceButton(isActive: model.selectedSize == size,
                             isLast: model.sizes.last == size,
                             size: size) {
                    model.selectedSize = size
                    orderModel.size = size
                }
            }
        }
    }
}
