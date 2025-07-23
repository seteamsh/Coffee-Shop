enum CategorySelected {
    case all
    case machiato
    case latte
    case americano
}

struct CategoryModel: Identifiable, Hashable {
    let id: Int
    var name: String
    var isActive: Bool = false
    var category : CategorySelected
}

var categories = [
    CategoryModel(id: 1, name: "All Coffee", category: .all),
    CategoryModel(id: 2, name: "Machiato", category: .machiato),
    CategoryModel(id: 3, name: "Latte", category: .latte),
    CategoryModel(id: 4, name: "Americano", category: .americano)
]

struct ProductModel: Identifiable, Hashable {
    let id: Int
    var name: String
    var description: String
    var price: String
    var rating: String
    var image: String
    var category: CategorySelected
}

var products = [
    ProductModel(id: 1, name: "Caffe Mocha", description: "Deep Foam", price: "$ 4.53", rating: "4.8", image: "caffeMocha", category: .machiato),
    ProductModel(id: 2, name: "Flat White", description: "Espresso", price: "$ 3.53", rating: "4.8", image: "flatWhite", category:  .americano),
    ProductModel(id: 3, name: "Mocha Fusion", description: "Ice/Hot", price: "$ 7.53", rating: "4.8", image: "mochaFusi", category:  .machiato),
    ProductModel(id: 4, name: "Caffe Panna", description: "Ice/Hot", price: "$ 5.53", rating: "4.8", image: "caffePanna", category:  .latte)
]
