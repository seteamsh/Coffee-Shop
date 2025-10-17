import SwiftUI
import Kingfisher

struct OrderScreen: View {
    @StateObject var model = OrderScreenModel()
    
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    OrderNavBar()
                    SelectedDeliveryType(model: model)
                    DeliveryAddress(model: model)
                    CustomDivider()
                    CheckoutProduct(model: model)
                    Rectangle()
                        .fill(.brownLight)
                        .frame(height: 4)
                    Discount()
                    PaymentSummary()
                }
                .padding(.horizontal, 24)
            }
            .background(.mainBg)
            OrderTapBar()
        }
        .environmentObject(router)
        .navigationBarBackButtonHidden()
    }
}

struct TypeCountBtn: View {
    var type: TypeCountButton
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 24, height: 24)
                    .overlay(Circle().stroke(.grayLighter, lineWidth: 1))
                Image(type.rawValue)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}

struct PaymentSummary: View {
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        Text("Payment Summary")
            .font(Font.custom(.sora, size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(.grayNormalActive)
        HStack(spacing: 0) {
            Text("Price")
                .font(Font.custom(.sora, size: 14))
                .fontWeight(.regular)
                .foregroundStyle(.grayNormal)
            Spacer()
            Text("$ \(String(format: "%.2f", orderModel.totalAmount ?? 0.0))")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.grayNormalActive)
        }
        HStack(spacing: 0) {
            Text("Delivery Fee")
                .font(Font.custom(.sora, size: 14))
                .fontWeight(.regular)
                .foregroundStyle(.grayNormal)
            Spacer()
            Text("$2.00")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.regular)
                .foregroundStyle(.grayNormalActive)
                .padding(.trailing, 8)
            Text("$1.00")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.grayNormalActive)
        }
    }
}



struct CheckoutProduct: View {
    @ObservedObject var model: OrderScreenModel
    @EnvironmentObject var orderModel: OrderModel
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
            HStack(spacing: 0) {
                TypeCountBtn(type: model.isActiveMinus ? .activeMinus : .notActiveMinus) {
                    model.increaseCount()
                    orderModel.count = model.count
                    
                }
                .padding(.trailing, 18)
                Text("\(model.count)")
                    .fontSora(size: 14, weight: .semibold, color: .greyNormalHover)
                    .padding(.trailing, 18)
                TypeCountBtn(type: .plus) {
                    model.count += 1
                    orderModel.count = model.count
                    
                }
            }
        }
        .frame(height: 54)
    }
}

struct EditButton: View {
    var editType: EditTypeButton
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(height: 26)
                .overlay(RoundedRectangle(cornerRadius: 16) .stroke(.lightActive, lineWidth: 1))
            HStack(spacing: 0) {
                Image(editType.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 14, height: 14)
                    .padding(.trailing, 4)
                
                Text(editType.name)
                    .font(Font.custom(.sora, size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(.grayNormal)
            }.padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
        }.padding(.trailing, 8)
    }
}

struct DeliveryAddress: View {
    @ObservedObject var model: OrderScreenModel
    var body: some View {
        Text("Delivery Address")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
        Text("Jl. Kpg Sutoyo")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
        Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.")
            .fontSora(size: 12, weight: .regular, color: .grayLighter)
        HStack(spacing: 0) {
            ForEach(model.editButtons) { button in
                EditButton(editType: button)
            }
        }
    }
}




#Preview {
    OrderScreen()
        .environmentObject(OrderModel())
        .environmentObject(Router())
}
