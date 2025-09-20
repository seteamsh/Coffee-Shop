enum CategorySelected: String, Identifiable, Equatable, Decodable {
    case all
    case machiato
    case latte
    case americano
    
    var id: Self {
        return self
    }
}



struct Size: Identifiable, Hashable {
    var id: Int
    var text: String
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
