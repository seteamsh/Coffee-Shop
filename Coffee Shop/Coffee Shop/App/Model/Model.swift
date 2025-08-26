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

struct Size: Identifiable, Hashable {
    var id: Int
    var text: String
}

struct ProductModel: Identifiable, Hashable {
    let id: Int
    var name: String
    var description: String
    var price: Double
    var rating: String
    var image: String
    var category: [CategorySelected] = [.all]
}

struct SelectedProduct: Hashable {
    var product: ProductModel?
    var size: Size?
    var count = 1
    var totalAmount: Double? {
        (product?.price ?? 0.0) * Double(count)
    }
    var typeDelivery: String?
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
    case plus = "plus"
    case notActiveMinus = "notActiveMinus"
    case activeMinus = "activeMinus"
}

enum Screen: Hashable {
    case main
    case details
    case order
    case delivery
    case search
}




enum IconsState: String {
    case activeHome = "activeHome"
    case inactiveHome = "inactiveHome"
    case activeFavorite = "activeFavorite"
    case inactiveFavorite = "inactiveFavorite"
    case activeShoppingBag = "activeShoppingBag"
    case inactiveShoppingBag = "inactiveShoppingBag"
    case activeNotifications = "activeNotification"
    case inactiveNotifications = "inactiveNotifications"
}

enum Tab: Hashable {
    case Main
    case Favorites
    case ShoppingBag
    case Notifications
}

struct TabViewButton: Identifiable, Equatable {
    let id: Int
    var activeIcon: IconsState
    var inactiveIcon: IconsState
    var tab: Tab
}

var tabViewIcons: [TabViewButton] = [
    TabViewButton(id: 1, activeIcon: .activeHome, inactiveIcon: .inactiveHome, tab: .Main),
    TabViewButton(id: 2, activeIcon: .activeFavorite, inactiveIcon: .inactiveFavorite, tab: .Favorites),
    TabViewButton(id: 3, activeIcon: .activeShoppingBag, inactiveIcon: .inactiveShoppingBag, tab: .ShoppingBag),
    TabViewButton(id: 4, activeIcon: .activeNotifications, inactiveIcon: .inactiveNotifications, tab: .Notifications)
]
