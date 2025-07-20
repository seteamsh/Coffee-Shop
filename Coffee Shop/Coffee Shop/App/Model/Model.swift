enum CategorySelectedState {
    case active
    case inActive
}

struct CategoryModel: Identifiable {
    let id: Int
    var name: String
}

var categories = [
    CategoryModel(id: 1, name: "All Coffee"),
    CategoryModel(id: 2, name: "Machiato"),
    CategoryModel(id: 3, name: "Latte"),
    CategoryModel(id: 4, name: "Americano")
]
