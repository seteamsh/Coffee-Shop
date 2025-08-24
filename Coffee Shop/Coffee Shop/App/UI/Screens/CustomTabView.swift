import SwiftUI

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

var arrIcons: [TabViewButton] = [
    TabViewButton(id: 1, activeIcon: .activeHome, inactiveIcon: .inactiveHome, tab: .Main),
    TabViewButton(id: 2, activeIcon: .activeFavorite, inactiveIcon: .inactiveFavorite, tab: .Favorites),
    TabViewButton(id: 3, activeIcon: .activeShoppingBag, inactiveIcon: .inactiveShoppingBag, tab: .ShoppingBag),
    TabViewButton(id: 4, activeIcon: .activeNotifications, inactiveIcon: .inactiveNotifications, tab: .Notifications)
]

struct CustomTabView: View {
    @State var selectionTab: Tab = .Main
    @State var path: [Tab] = [.Main]
    @State var wishList: [ProductModel?] = []
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
                ZStack {
                    switch selectionTab {
                    case .Main:
                        MainScreen(wishList: $wishList)
                    case .Favorites:
                        FavoritesScreen(wishList: $wishList)
                    case .ShoppingBag:
                        ShoppingBagScreen()
                    case .Notifications:
                        NotificationsScreen()
                    }
                }
                   
                HStack(spacing: 0) {
                    ForEach(arrIcons) { icon in
                        ButtonIcon(icon: icon, isActive: selectionTab == icon.tab) {
                            selectionTab = icon.tab
                            
                        }
                        if !(arrIcons.last == icon) {
                            Spacer()
                        }
                    }
                }
                .padding(EdgeInsets(top: 24, leading: 55.5, bottom: 51, trailing: 55.5))
                .background(.white)
                .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 24, topTrailing: 24)))
            }
            .background(.mainBg)
            .ignoresSafeArea()
        }
    }
}

struct ButtonIcon: View {
    var icon: TabViewButton
    var isActive: Bool
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 0) {
                Image(isActive ? icon.activeIcon.rawValue : icon.inactiveIcon.rawValue)
                    .resizable()
                    .foregroundStyle(.lightActive)
                    .frame(width: 24, height: 24)
                if isActive {
                    Rectangle()
                        .fill(.brownNormal)
                        .frame(width: 10, height: 5)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .padding(.top, 6)
                }
            }
        }

    }
}

#Preview {
    CustomTabView()
}
