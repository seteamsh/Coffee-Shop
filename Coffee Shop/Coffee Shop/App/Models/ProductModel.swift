struct ProductModel: Identifiable, Hashable, Encodable, Decodable {
    let id: Int
    var name: String
    var modificator: String
    var description: String
    var price: Double
    var rating: String
    var image: String
    var category: [CategorySelected] = [.all]
}
