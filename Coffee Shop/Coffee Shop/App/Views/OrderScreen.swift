import SwiftUI


struct OrderScreen: View {
    @StateObject var model = OrderScreenModel()
    
    @EnvironmentObject var router: Router
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Button {
                                router.goBack()
                            } label: {
                                Image(.back)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)
                            
                            Spacer()
                            
                            Text("Order")
                                .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)

                                .padding(EdgeInsets(top: 12.5, leading: 0, bottom: 12.5, trailing: 0))
                            
                            Spacer()
                            
                            Rectangle()
                                .fill(.mainBg)
                                .frame(width: 24, height: 24)
                                .padding(10)
                        }
                        .padding(.top, 24)
                        OrderType(model: model)
                            .padding(.bottom, 24)
                        DeliveryAddress(model: model)
                            .padding(.bottom, 16)
                        CustomDivider()
                            .padding(.bottom, 16)
                        CheckoutProduct(model: model)
                        Rectangle()
                            .fill(.brownLight)
                            .frame(height: 4)
                            .padding([.top, .bottom], 16)
                        Discount()
                            .padding(.bottom, 24)
                        PaymentSummary()
                    }
                    .padding([.leading, .trailing], 24)
                    Spacer()
                    
                }
                    .navigationBarBackButtonHidden()
                    .ignoresSafeArea(edges: .bottom)
                
            }.background(.mainBg)
            OrderTapBar()
        }
        .environmentObject(router)
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

struct Discount: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 56)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16) .stroke(.categoryNotActive, lineWidth: 1))
            HStack(spacing: 0) {
                Image(.discount)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fill)
                    .padding(.trailing, 16)
                Text("1 Discount is Applies")
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.semibold)
                Spacer()
                Image(.right)
                    .resizable()
                    .frame(width: 21, height: 21)
                    .aspectRatio(contentMode: .fill)
            }.padding(EdgeInsets(top: 18, leading: 16, bottom: 18, trailing: 16))
        }
            
    }
}

struct CheckoutProduct: View {
    @ObservedObject var model: OrderScreenModel
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        HStack(spacing: 0) {
            
            if let imageUrl = orderModel.product?.image, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
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
            .padding(.bottom, 16)
        Text("Jl. Kpg Sutoyo")
            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
            .padding(.bottom, 4)
        Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.")
            .fontSora(size: 12, weight: .regular, color: .grayLighter)
            .padding(.bottom, 16)
        HStack(spacing: 0) {
            ForEach(model.editButtons) { button in
                EditButton(editType: button)
            }
        }
    }
}

struct OrderType: View {
    @ObservedObject var model: OrderScreenModel
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.categoryNotActive)
            HStack(spacing: 0) {
                ForEach(model.orderTypes) { type in
                    OrderTypeButton(isActive: model.selectedTypeOrder == type, type: type) {
                        model.selectedTypeOrder = type
                        orderModel.typeDelivery = type.name
                    }
                }
            }
            
        }
        .frame(height: 43)
    }
}
struct OrderTypeButton: View {
    var isActive: Bool
    var type: TypeOrder
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 150, height: 34)
                    .foregroundStyle(isActive ? .brownNormal : .categoryNotActive)
                Text(type.name)
                    .fontSora(
                        size: 16,
                        weight: isActive ? .semibold : .regular,
                        color: isActive ? .white : .grayNormalActive
                    )
            }
        }
    }
}

#Preview {
    OrderScreen()
        .environmentObject(OrderModel())
        .environmentObject(Router())
}
