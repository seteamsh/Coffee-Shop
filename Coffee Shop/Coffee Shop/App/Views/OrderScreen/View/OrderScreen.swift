import SwiftUI
import Kingfisher

struct OrderScreen: View {
    //MARK: - Properties
    @StateObject var model = OrderScreenModel()
    @EnvironmentObject var router: Router
    
    //MARK: - Body
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

#Preview {
    OrderScreen()
        .environmentObject(OrderModel())
        .environmentObject(Router())
}
