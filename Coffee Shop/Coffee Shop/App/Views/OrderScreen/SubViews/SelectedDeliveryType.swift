import SwiftUI

struct SelectedDeliveryType: View {
    @ObservedObject var model: OrderScreenViewModel
    @EnvironmentObject var orderModel: OrderViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.categoryNotActive)
            HStack(spacing: 0) {
                OrderTypeButton(name: .devlier, isActive: model.getSelectedTypeOrder() == .devlier) {
                    model.setSelectedTypeOrder(.devlier)
                    orderModel.typeDelivery = .devlier
                }
                OrderTypeButton(name: .pickUp, isActive: model.getSelectedTypeOrder() == .pickUp) {
                    model.setSelectedTypeOrder(.pickUp) 
                    orderModel.typeDelivery = .pickUp
                }
                
            }
            
        }
        .frame(height: 43)
    }
}

#Preview {
    SelectedDeliveryType(model: OrderScreenViewModel())
        .environmentObject(OrderViewModel())
}
