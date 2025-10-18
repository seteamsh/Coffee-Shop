import SwiftUI

class OrderModel: ObservableObject {
    @Published var product: ProductModel?
    @Published var size: Size?
    @Published var count = 1
    @Published var typeDelivery: DeliveryType = .devlier
    var totalAmount: Double? {
        (product?.price ?? 0.0) * Double(count)
    }
    
}

