struct CategoryModel: Identifiable, Hashable, Equatable {
    let id: Int
    var name: String
    var isActive: Bool = false
    var category : CategorySelected
}
