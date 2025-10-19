import SwiftUI

struct CustomTabView: View {
    @StateObject var model = CustomTabViewModel()
    var body: some View {
            VStack(spacing: 0) {
                ZStack {
                    switch model.selectionTab {
                    case .Main:
                        MainScreen()
                    case .Favorites:
                        FavoritesScreen()
                    case .ShoppingBag:
                        CardScreen()
                    case .Notifications:
                        NotificationsScreen()
                    }
                }
                TabView(model: model)
            }
            .background(.mainBg)
            .ignoresSafeArea(edges: .bottom)
    }
}

struct TabView: View {
    @ObservedObject var model: CustomTabViewModel
    var body: some View {
        HStack(spacing: 0) {
            ForEach(model.tabViewIcons) { icon in
                ButtonIcon(icon: icon, isActive: model.selectionTab == icon.tab) {
                    model.selectionTab = icon.tab
                    
                }
                if !(model.tabViewIcons.last == icon) {
                    Spacer()
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 55.5, bottom: 30, trailing: 55.5))
        .background(.white)
        .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 24, topTrailing: 24)))
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
        .environmentObject(FavoritesScreenViewModel())
}
