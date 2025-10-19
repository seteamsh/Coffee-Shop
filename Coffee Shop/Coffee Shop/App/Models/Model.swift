

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
