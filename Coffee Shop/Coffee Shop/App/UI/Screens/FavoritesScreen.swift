//
//  FavoritesScreen.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 17.08.2025.
//

import SwiftUI
import SwipeActions

class FavoritesScreenModel: ObservableObject {
    @Published var wishList: [ProductModel?] = []
    @Published var path: [Screen] = []
    
    func goToDetails() {
        path.append(.details)
    }
}

struct FavoritesScreen: View {
    @EnvironmentObject var favoritesScreenModel: FavoritesScreenModel
    @StateObject var router = Router()
    var body: some View {
        VStack(spacing: 0) {
            NavigationStack(path: $favoritesScreenModel.path) {
                ScrollView(.vertical) {
                    ForEach(favoritesScreenModel.wishList, id: \.self) { productModel in
                        WishCard(productModel: productModel)
                            .onTapGesture {
                                
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
                            }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct WishCard: View {
    var productModel: ProductModel?
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(productModel?.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.trailing, 15)
                VStack(alignment: .leading, spacing: 0) {
                    Text(productModel?.name ?? "")
                        .font(Font.custom(.sora, size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.grayNormalActive)
                    
                    Text(productModel?.description ?? "")
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
        .environmentObject(FavoritesScreenModel())
}
