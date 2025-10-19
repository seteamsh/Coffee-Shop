import SwiftUI
@MainActor
final class MainScreenViewModel: ObservableObject {
    //MARK: - Properties
    @Published var searchBar = ""
    @Published var selectedProduct: SelectedProduct?
    @Published var products: [ProductModel] = []
    private var categories: [Category] = [Category(id: 0, name: "All Coffee")]
    @Published private(set) var categorySelected: Category = Category(id: 0, name: "All Coffee")
    
    //MARK: - Initalizer
    init() {
        fetchCategories()
        fetchProducts()
        NotificationService.shared.requestPermission()
    }
    
    //MARK: - Methods
    func setCategorySelected(category: Category) {
        categorySelected = category
    }
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProductFromSelectedCategories() -> [ProductModel] {
        if categorySelected.id == 0 {
            return products
        } else {
            return products.filter { $0.category.contains(categorySelected) }
        }
    }
    
    func fetchProducts() {
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
    
    func fetchCategories() {
        Task {
            do {
                let fetchCategories = try await NetworkManager.shared.getCategories()
                categories.append(contentsOf: fetchCategories)
            } catch {
                if let error = error as? URLError {
                    print(error)
                }
            }
        }
    }
}
