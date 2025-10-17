import SwiftUI

struct SelectedDeliveryType: View {
    @ObservedObject var model: OrderScreenModel
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.categoryNotActive)
            HStack(spacing: 0) {
                OrderTypeButton(name: .devlier, isActive: model.selectedTypeOrder == .devlier) {
                    model.selectedTypeOrder = .devlier
                    orderModel.typeDelivery = .devlier
                }
                OrderTypeButton(name: .pickUp, isActive: model.selectedTypeOrder == .pickUp) {
                    model.selectedTypeOrder = .pickUp
                    orderModel.typeDelivery = .pickUp
                }
                
            }
            
        }
        .frame(height: 43)
    }
}
