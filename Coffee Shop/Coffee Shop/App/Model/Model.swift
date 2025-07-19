struct CategoryModel: Identifiable {
    let id: Int
    var name: String
    var isSelected: Bool = false
}

var categories = [
    CategoryModel(id: 1, name: "All Coffee", isSelected: true),
    CategoryModel(id: 2, name: "Machiato"),
    CategoryModel(id: 3, name: "Latte"),
    CategoryModel(id: 4, name: "Americano")
]
