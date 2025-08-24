import SwiftUI
class OrderScreenModel: ObservableObject {
    @Published var selectedTypeOrder: TypeOrder?
    @Published var selectedEditButton: EditTypeButton?
    @Published var count = 1
    var orderTypes = [
        TypeOrder(id: 1, name: "Deliver"),
        TypeOrder(id: 2, name: "Pick Up")
        ]
    var editButtons = [
        EditTypeButton(id: 1, name: "Edit Address", image: "edit"),
        EditTypeButton(id: 2, name: "Add note", image: "note")
        ]
    var isActiveMinus: Bool {
        count == 1 ? false : true
    }
    func increaseCount() {
        if count == 1 {
            return
        } else if count > 1 {
            count -= 1
        }
    }
}

struct OrderScreen: View {
    @StateObject var model = OrderScreenModel()
    @ObservedObject var mainModel: MainScreenModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Button {
                            dismiss()
                        } label: {
                            Image(.back)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .padding(10)
                        
                        Spacer()
                        
                        Text("Order")
                            .font(Font.custom(.sora, size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.grayNormalActive)
                            .padding(EdgeInsets(top: 12.5, leading: 0, bottom: 12.5, trailing: 0))
                        
                        Spacer()
                        
                        Rectangle()
                            .fill(.mainBg)
                            .frame(width: 24, height: 24)
                            .padding(10)
                    }
                    .padding(.top, 24)
                    OrderType(model: model, mainModel: mainModel)
                        .padding(.bottom, 24)
                    DeliveryAddress(model: model)
                        .padding(.bottom, 16)
                    CustomDivider()
                        .padding(.bottom, 16)
                    CheckoutProduct(model: model, mainModel: mainModel)
                    Rectangle()
                        .fill(.brownLight)
                        .frame(height: 4)
                        .padding([.top, .bottom], 16)
                    Discount()
                        .padding(.bottom, 24)
                    PaymentSummary(mainModel: mainModel)
                }
                .padding([.leading, .trailing], 24)
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 165)
                        .clipShape(
                            .rect(topLeadingRadius: 16, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 16))
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Image(.wallet)
                                .resizable()
                                .frame(width: 15.95, height: 14.73)
                                .padding(.trailing, 9.5)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Cash/Wallet")
                                    .font(Font.custom(.sora, size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.grayNormalActive)
                                Text("$ \(String(format: "%.2f", mainModel.selectedProduct?.totalAmount ?? 0.0))")
                                    .font(Font.custom(.sora, size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.brownNormal)
                            }
                            Spacer()
                            Image(.down)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .padding(EdgeInsets(top: 16, leading: 24, bottom: 12, trailing: 24))
                        Button {
                            //mainModel.selectedProduct?.count = model.count
                            if mainModel.selectedProduct?.typeDelivery == nil {
                                return
                            } else {
                                print("\(String(describing: mainModel.selectedProduct))")
                                mainModel.goToDelivery()
                            }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(.brownNormal)
                                    .frame(height: 56)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                                Text("Buy Now")
                                    .font(Font.custom(.sora, size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(EdgeInsets(top: 16, leading: 24, bottom: 12, trailing: 24))
                    }
                }
            }.background(.mainBg)
                .navigationBarBackButtonHidden()
                .ignoresSafeArea(edges: .bottom)
        }
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
    @ObservedObject var mainModel: MainScreenModel
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
            Text("$ \(String(format: "%.2f", mainModel.selectedProduct?.totalAmount ?? 0.0))")
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
    @ObservedObject var mainModel: MainScreenModel
    var body: some View {
        HStack(spacing: 0) {
            Image(mainModel.selectedProduct?.product?.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 0) {
                Text(mainModel.selectedProduct?.product?.name ?? "")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.grayNormalActive)
                
                Text(mainModel.selectedProduct?.product?.description ?? "")
                    .font(Font.custom(.sora, size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(.grayLighter)
            }
            .padding(.leading, 16)
            Spacer()
            HStack(spacing: 0) {
                TypeCountBtn(type: model.isActiveMinus ? .activeMinus : .notActiveMinus) {
                    model.increaseCount()
                    mainModel.selectedProduct?.count = model.count
                    
                }
                .padding(.trailing, 18)
                Text("\(model.count)")
                    .padding(.trailing, 18)
                TypeCountBtn(type: .plus) {
                    model.count += 1
                    mainModel.selectedProduct?.count = model.count
                    
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
            .font(Font.custom(.sora, size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(.grayNormalActive)
            .padding(.bottom, 16)
        Text("Jl. Kpg Sutoyo")
            .font(Font.custom(.sora, size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(.grayNormalActive)
            .padding(.bottom, 4)
        Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.")
            .font(Font.custom(.sora, size: 12))
            .fontWeight(.regular)
            .foregroundStyle(.grayLighter)
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
    @ObservedObject var mainModel: MainScreenModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.categoryNotActive)
            HStack(spacing: 0) {
                ForEach(model.orderTypes) { type in
                    OrderTypeButton(isActive: model.selectedTypeOrder == type, type: type) {
                        model.selectedTypeOrder = type
                        mainModel.selectedProduct?.typeDelivery = type.name
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
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(isActive ? .semibold : .regular)
                    .foregroundStyle(isActive ? .white : .grayNormalActive)
            }
        }
    }
}

#Preview {
    OrderScreen(mainModel: MainScreenModel())
}
