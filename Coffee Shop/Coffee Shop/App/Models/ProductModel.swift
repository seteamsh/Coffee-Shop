struct ProductModel: Identifiable, Hashable {
    let id: Int
    var name: String
    var description: String
    var price: Double
    var rating: String
    var image: String
    var category: [CategorySelected] = [.all]
}
