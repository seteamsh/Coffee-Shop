import SwiftUI

class MainScreenModel: ObservableObject {
    @Published var searchBar = ""
    @Published var categorySelected: CategorySelected = .all
    @Published var selectedProduct: SelectedProduct?
    @Published private(set) var categories: [CategoryModel] = []
    @Published private(set) var  products: [ProductModel] = []
    private let productService: ProductServiceProtocol
    private let categoryService: CategoryServiceProtocol
    init(categoryService: CategoryServiceProtocol = MockCategoryService(), productService: ProductServiceProtocol = MockProductService()) {
        self.categoryService = categoryService
        self.productService = productService
        loadCategories()
        loadProducts()
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
    private func loadProducts() {
        products = productService.getProducts()
    }
    
}
