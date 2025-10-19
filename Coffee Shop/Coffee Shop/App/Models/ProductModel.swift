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
