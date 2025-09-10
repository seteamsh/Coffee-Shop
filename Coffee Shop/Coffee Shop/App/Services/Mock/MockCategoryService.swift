class MockCategoryService: CategoryServiceProtocol {
    func getCategories() -> [CategoryModel] {
        return [
            CategoryModel(id: 1, name: "All Coffee", category: .all),
            CategoryModel(id: 2, name: "Machiato", category: .machiato),
            CategoryModel(id: 3, name: "Latte", category: .latte),
            CategoryModel(id: 4, name: "Americano", category: .americano)
        ]
    }
}
