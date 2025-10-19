
import SwiftUI

struct ProductGrid: View {
    
    @ObservedObject var vm: MainViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(maximum: .infinity)),
            GridItem(.flexible(maximum: .infinity))
        ], spacing: 24) {
            ForEach(vm.getProductFromSelectedCategories()) { product in
                Button {
                    orderModel.product = product
                    router.push(.details)
                } label: {
                    Product(product: product)
                }
            }
        }
        //.padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
    }
}

#Preview {
    MainView()
}
