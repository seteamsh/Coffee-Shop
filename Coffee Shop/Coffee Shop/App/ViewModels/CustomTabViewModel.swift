import SwiftUI

class CustomTabViewModel: ObservableObject {
    @Published var selectionTab: Tab = .Main
    @Published var path: [Tab] = [.Main]
    
    var tabViewIcons: [TabViewButton] = [
        TabViewButton(id: 1, activeIcon: .activeHome, inactiveIcon: .inactiveHome, tab: .Main),
        TabViewButton(id: 2, activeIcon: .activeFavorite, inactiveIcon: .inactiveFavorite, tab: .Favorites),
        TabViewButton(id: 3, activeIcon: .activeShoppingBag, inactiveIcon: .inactiveShoppingBag, tab: .ShoppingBag),
        TabViewButton(id: 4, activeIcon: .activeNotifications, inactiveIcon: .inactiveNotifications, tab: .Notifications)
    ]

    
}
