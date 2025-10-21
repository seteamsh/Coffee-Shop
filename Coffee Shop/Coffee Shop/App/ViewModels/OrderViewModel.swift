import SwiftUI
enum ProductError: Error {
    case notSelectedProduct
}
class OrderViewModel: ObservableObject {
    //MARK: - Properties
    @Published private(set) var product: ProductModel?
    @Published private(set) var size: SizeOfCup?
    @Published var quantity = 1
    @Published var typeDelivery: DeliveryType = .devlier
    
    //MARK: - Methods
    var totalAmount: Double? {
        (product?.price ?? 0.0) * Double(quantity)
    }
    func getSize() -> SizeOfCup? {
        if let unwrappedSize = size {
            return unwrappedSize
        } else {
            return nil
        }
    }
    func setSize(_ size: SizeOfCup) {
        self.size = size
    }
    func setProduct(_ product: ProductModel) {
        self.product = product
    }
    func getProduct() -> ProductModel {
        if let unwrappedProduct = product {
            return unwrappedProduct
        } else {
            return ProductModel(
                id: 0,
                name: "",
                modificator: "",
                description: "",
                price: 0.0,
                rating: "",
                image: "",
                category: [Category(id: 0, name: "")]
            )
        }
    }
}
