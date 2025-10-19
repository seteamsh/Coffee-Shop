import SwiftUI

struct CheckoutProduct: View {
    @ObservedObject var model: OrderScreenViewModel
    @EnvironmentObject var orderModel: OrderViewModel
    var body: some View {
        HStack(spacing: 0) {
            CardImage(imageURL: orderModel.product?.image ?? "")
                .frame(width: 54, height: 54)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 0) {
                Text(orderModel.product?.name ?? "")
                    .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
                
                Text(orderModel.product?.modificator ?? "")
                    .fontSora(size: 12, weight: .regular, color: .grayLighter)
            }
            .padding(.leading, 16)
            Spacer()
            HStack(spacing: 18) {
                TypeCountBtn(type: model.isActiveMinus ? .activeMinus : .notActiveMinus) {
                    model.decreaseCount()
                    orderModel.quantity = model.getCount()
                }
                
                Text("\(model.getCount())")
                    .fontSora(size: 14, weight: .semibold, color: .greyNormalHover)
                
                TypeCountBtn(type: .plus) {
                    model.increaseCount()
                    orderModel.quantity = model.getCount()
                    
                }
            }
        }
        .frame(height: 54)
    }
}

#Preview {
    CheckoutProduct(model: OrderScreenViewModel())
        .environmentObject(OrderViewModel())
}
