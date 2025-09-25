import SwiftUI
@MainActor
final class MainViewModel: ObservableObject {
    @Published var searchBar = ""
    @Published var categorySelected: CategorySelected = .all
    @Published var selectedProduct: SelectedProduct?
    @Published private(set) var categories: [CategoryModel] = []
    @Published var  products: [ProductModel] = []
    private let categoryService: CategoryServiceProtocol
    init(categoryService: CategoryServiceProtocol = MockCategoryService()) {
        self.categoryService = categoryService
        loadCategories()
        fetchProducts()
        NotificationService.shared.requestPermission()
    }
    
    var filteredProducts: [ProductModel] {
        get {
            if categorySelected == .all {
                return products
            } else {
                return products.filter { $0.category.contains(categorySelected) }
            }
        }
    }
    
    private func loadCategories() {
        categories = categoryService.getCategories()
    }
    
    func fetchProducts()  {
        Task {
            do {
                let fetchedProducts = try await NetworkManager.shared.getProducts()
                products = fetchedProducts
            } catch {
                if let error = error as? URLError {
                    print(error)
                }
            }
        }
    }
    
}
