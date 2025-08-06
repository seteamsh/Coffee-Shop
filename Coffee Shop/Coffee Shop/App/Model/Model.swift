enum CategorySelected: Identifiable, Equatable {
    case all
    case machiato
    case latte
    case americano
    
    var id: Self {
        return self
    }
}

struct CategoryModel: Identifiable, Hashable, Equatable {
    let id: Int
    var name: String
    var isActive: Bool = false
    var category : CategorySelected
}

struct ProductModel: Identifiable, Hashable {
    let id: Int
    var name: String
    var description: String
    var price: String
    var rating: String
    var image: String
    var category: [CategorySelected] = [.all]
}

struct TypeOrder: Identifiable, Hashable {
    let id: Int
    var name: String
}

struct EditTypeButton: Identifiable, Hashable {
    let id: Int
    var name: String
    var image: String
}

enum TypeCountButton: String {
    case add = "add"
    case minus = "minus"
}
