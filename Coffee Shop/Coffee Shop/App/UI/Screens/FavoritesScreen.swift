//
//  FavoritesScreen.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 17.08.2025.
//

import SwiftUI
import SwipeActions

class FavoritesScreenModel: ObservableObject {
    @Published var wishList: [SelectedProduct?] = []
    @Published var path: [Screen] = []
    func goToDetails () {
        path.append(.details)
    }
    func goToOrder() {
        path.append(.order)
    }
    func goToDelivery() {
        path.append(.delivery)
    }
    func goToSearch() {
        path.append(.search)
    }
    
}

struct FavoritesScreen: View {
    @StateObject var favoritesScreenModel: FavoritesScreenModel
    var body: some View {
        NavigationStack(path: $favoritesScreenModel.path) {
            VStack(spacing: 0) {
                ScrollView(.vertical) {
                    ForEach(favoritesScreenModel.wishList, id: \.self) { productModel in
                        WishCard(productModel: productModel)
                            .onTapGesture {
                                print("WishCard Tapped")
                                //передать в detailScreen(inputSelectedProduct: productModel)
                            }
                            
                            .navigationDestination(for: Screen.self) { screen in
                                switch screen {
                                case .details:
                                    DetailScreen(inputSelectedProduct: productModel)
                                case .delivery:
                                    DeliveryScreen()
                                case .order:
                                    OrderScreen(inputSelectedProduct: $productModel)
                                case .main:
                                    EmptyView()
                                case .search:
                                    SearchScreen()
                                }
                            }
                        //Проблема в destination, попробовать передать через перменную выбранный продукт, напрямую не получится из за того что походу нельзя дестинатион ложить в for each
                    }
                    Spacer()
                }
            }
        }
    }
}

struct WishCard: View {
    var productModel: SelectedProduct?
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(productModel?.product?.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.trailing, 15)
                VStack(alignment: .leading, spacing: 0) {
                    Text(productModel?.product?.name ?? "")
                        .font(Font.custom(.sora, size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.grayNormalActive)
                    
                    Text(productModel?.product?.description ?? "")
                        .font(Font.custom(.sora, size: 12))
                        .fontWeight(.regular)
                        .foregroundStyle(.grayLighter)
                }
                Spacer()
                Text("$ \(String(format: "%.2f", productModel?.product?.price ?? 0.0))")
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
        .environmentObject(FavoritesScreenModel())
}
