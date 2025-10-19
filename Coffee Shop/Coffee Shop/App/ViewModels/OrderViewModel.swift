import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var product: ProductModel?
    @Published var size: SizeOfCup?
    @Published var quantity = 1
    @Published var typeDelivery: DeliveryType = .devlier
    var totalAmount: Double? {
        (product?.price ?? 0.0) * Double(quantity)
    }
}
