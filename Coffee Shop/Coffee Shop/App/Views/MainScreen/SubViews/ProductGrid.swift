
import SwiftUI

struct ProductGrid: View {
    
    @ObservedObject var vm: MainScreenViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var orderViewModel: OrderViewModel
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(maximum: .infinity)),
            GridItem(.flexible(maximum: .infinity))
        ], spacing: 24) {
            ForEach(vm.getProductFromSelectedCategories()) { product in
                Button {
                    orderViewModel.setProduct(product)
                    router.push(.details)
                } label: {
                    Product(product: product)
                }
            }
        }
    }
}

#Preview {
    MainScreen()
}
