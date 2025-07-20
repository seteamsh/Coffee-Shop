enum CategorySelectedState {
    case active
    case inActive
}

struct CategoryModel: Identifiable, Hashable {
    let id: Int
    var name: String
    var isSelected = false
}

var categories = [
    CategoryModel(id: 1, name: "All Coffee", isSelected: true),
    CategoryModel(id: 2, name: "Machiato"),
    CategoryModel(id: 3, name: "Latte"),
    CategoryModel(id: 4, name: "Americano")
]
