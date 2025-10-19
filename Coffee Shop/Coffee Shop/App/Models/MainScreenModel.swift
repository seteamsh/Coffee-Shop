struct Category: Identifiable, Hashable, Codable, Equatable {
    let id: Int
    var name: String
}

struct SelectedProduct: Hashable {
    var product: ProductModel?
    var size: SizeOfCup?
    var count = 1
    var totalAmount: Double? {
        (product?.price ?? 0.0) * Double(count)
    }
    var typeDelivery: String?
}

struct ProductModel: Identifiable, Hashable, Codable {
    let id: Int
    var name: String
    var modificator: String
    var description: String
    var price: Double
    var rating: String
    var image: String
    var category: [Category]
}
