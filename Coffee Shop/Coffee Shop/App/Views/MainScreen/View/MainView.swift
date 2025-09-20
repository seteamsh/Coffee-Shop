import SwiftUI

struct MainView: View {
    @StateObject var model = MainViewModel()
    @StateObject var router = Router()
    @StateObject var orderModel = OrderModel()
    var body: some View {
        NavigationStack(path: $router.path) {
            ScrollView(.vertical) {
                ZStack {
                    VStack(spacing: 0) {
                        ZStack {
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
                            
                        }
                        .frame(height: 238)
                        Spacer()
                    }
                    VStack(spacing: 0) {
                        Location()
                            .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
                        Button(action: {
                            router.push(.search)
                        }, label: {
                            SearchBar()
                        })
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
                        Banner()
                        ProductGrid(model: model)
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
                }
            }
            .background(Color.mainBg)
        }
        .environmentObject(router)
        .environmentObject(orderModel)
    }
}

#Preview {
    MainView()
        .environmentObject(FavoritesScreenModel())
}
