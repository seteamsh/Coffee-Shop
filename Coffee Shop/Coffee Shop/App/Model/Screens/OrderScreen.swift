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
        
}

struct OrderScreen: View {
    @StateObject var model = OrderScreenModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Image(.back)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(10)
                
                Spacer()

                Text("Detail")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.grayNormalActive)
                    .padding(EdgeInsets(top: 12.5, leading: 0, bottom: 12.5, trailing: 0))
                
                Spacer()
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 24, height: 24)
                    .padding(10)
            }
            .padding(.top, 24)
            OrderType(model: model)
                .padding(.bottom, 24)
            DeliveryAddress(model: model)
            CheckoutProduct(model: model)
            Spacer()
        }
        .padding([.leading, .trailing], 24)
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

struct CheckoutProduct: View {
    @ObservedObject var model: OrderScreenModel
    var body: some View {
        HStack(spacing: 0) {
            Image(.caffeMocha)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 0) {
                Text("Caffe Mocha")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.grayNormalActive)
                
                Text("Deep Foam")
                    .font(Font.custom(.sora, size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(.grayLighter)
            }
            .padding(.leading, 16)
            Spacer()
            HStack(spacing: 0) {
                TypeCountBtn(type: .minus) {
                    model.count -= 1
                }
                .padding(.trailing, 18)
                Text("\(model.count)")
                    .padding(.trailing, 18)
                TypeCountBtn(type: .add) {
                    model.count += 1
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
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.categoryNotActive)
            HStack(spacing: 0) {
                ForEach(model.orderTypes) { type in
                    OrderTypeButton(isActive: model.selectedTypeOrder == type, type: type) {
                        model.selectedTypeOrder = type
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
    OrderScreen()
}
