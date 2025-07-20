enum CategorySelected {
    case all
    case machiato
    case latte
    case americano
}

struct CategoryModel: Identifiable, Hashable {
    let id: Int
    var name: String
    var isActive: CategorySelected
}

var categories = [
    CategoryModel(id: 1, name: "All Coffee", isActive: .all),
    CategoryModel(id: 2, name: "Machiato", isActive: .machiato),
    CategoryModel(id: 3, name: "Latte", isActive: .latte),
    CategoryModel(id: 4, name: "Americano", isActive: .americano)
]
