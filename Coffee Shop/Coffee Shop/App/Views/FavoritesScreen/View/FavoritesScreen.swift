import SwiftUI
import SwipeActions

struct FavoritesScreen: View {
    @EnvironmentObject var favoritesScreenModel: FavoritesScreenViewModel
    @StateObject var orderModel = OrderViewModel()
    @StateObject var router = Router()
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Text("Wish List")
                        .font(Font.custom(.sora, size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.grayNormalActive)
                    Spacer()
                }
                .padding([.top, .bottom], 24)
                Divider()
                ScrollView(.vertical) {
                    ForEach(favoritesScreenModel.wishList, id: \.self) { productModel in
                        WishCard(productModel: productModel)
                            .onTapGesture {
                                orderModel.product = productModel
                                router.push(.details)
                                //передать в detailScreen(inputSelectedProduct: productModel)
                            }
                            .addFullSwipeAction(menu: .slided,
                                                swipeColor: .red) {
                                Leading {
                                    
                                }
                                Trailing {
                                    HStack(spacing: 0) {
                                        Button {
                                            favoritesScreenModel.wishList.remove(at: favoritesScreenModel.wishList.firstIndex(of: productModel)!)
                                            UserDefaults.standard.saveFavoritesCoffee(favoritesScreenModel.wishList)
                                        } label: {
                                            Image(systemName: "trash")
                                                .foregroundStyle(.white)
                                            
                                        }
                                        .contentShape(Rectangle())
                                        .frame(width: 80)
                                        .frame(maxHeight: .infinity)
                                        .background(Color.red)
                                        
                                    }
                                }
                            } action: {
                                favoritesScreenModel.wishList.remove(at: favoritesScreenModel.wishList.firstIndex(of: productModel)!)
                                UserDefaults.standard.saveFavoritesCoffee(favoritesScreenModel.wishList)
                            }
                    }
                    Spacer()
                }
            }
            .background(Color.mainBg)
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
        .environmentObject(orderModel)
        .environmentObject(router)
        .onAppear {
            favoritesScreenModel.wishList = UserDefaults.standard.loadFavoritesCoffee()
        }
    }
}

struct WishCard: View {
    var productModel: ProductModel?
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                CardImage(imageURL: productModel?.image ?? "")
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.trailing, 15)
                VStack(alignment: .leading, spacing: 0) {
                    Text(productModel?.name ?? "")
                        .font(Font.custom(.sora, size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.grayNormalActive)
                    
                    Text(productModel?.modificator ?? "")
                        .font(Font.custom(.sora, size: 12))
                        .fontWeight(.regular)
                        .foregroundStyle(.grayLighter)
                }
                Spacer()
                Text("$ \(String(format: "%.2f", productModel?.price ?? 0.0))")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.grayNormalActive)
            }
            .frame(height: 54)
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
            Divider()
        }
    }
}
#Preview {
    FavoritesScreen()
        .environmentObject(FavoritesScreenViewModel())
}
