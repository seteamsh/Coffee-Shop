import SwiftUI

struct MainScreen: View {
    @StateObject var vm = MainScreenViewModel()
    @StateObject var router = Router()
    @StateObject var orderModel = OrderViewModel()
    var body: some View {
        NavigationStack(path: $router.path) {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: .mainBgGradientEnd, location: 0.2),
                                        Gradient.Stop(color: .mainBgGradientStart, location: 1)
                                    ],
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                            .frame(height: UIScreen.main.bounds.height * 0.29)
                        Spacer()
                    }
                    VStack(spacing: 24) {
                        Location()
                            .padding(.top, 24)
                        SearchBar()
                        Banner()
                        CategorySlider(vm: vm)
                        ProductGrid(vm: vm)
                            .navigationDestination(for: Screen.self) { screen in
                                switch screen {
                                case .details:
                                    DetailScreen()
                                case .delivery:
                                    DeliveryScreen()
                                case .order:
                                    OrderScreen()
                                case .main:
                                    EmptyView()
                                case .search:
                                    SearchScreen()
                                }
                            }
                    }
                    .padding(.horizontal, 24)
                }
            }
            .background(Color.mainBg)
        }
        .environmentObject(router)
        .environmentObject(orderModel)
    }
}

#Preview {
    MainScreen()
        .environmentObject(FavoritesScreenViewModel())
}
