//
//  NavBar.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 22.09.2025.
//

import SwiftUI

struct DetailNavBar: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var favoritesScreenModel: FavoritesScreenViewModel
    @EnvironmentObject var orderModel: OrderViewModel
    var isAdded: Bool {
        favoritesScreenModel.wishList.contains(orderModel.product)
    }
    var body: some View {
        HStack(spacing: 0) {
            Button {
                router.goBack()
            } label: {
                Image("back")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
                

            Spacer()
            Text("Detail")
                .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
            Spacer()
            Button {
                if isAdded { favoritesScreenModel.wishList.remove(at: favoritesScreenModel.wishList.firstIndex(of: orderModel.product)!) }
                else {
                    favoritesScreenModel.wishList.append(orderModel.product)
                    UserDefaults.standard.saveFavoritesCoffee(favoritesScreenModel.wishList)
                }
                print("\(favoritesScreenModel.wishList)")
            } label: {
                Image(isAdded ? .addedToWishList : .favorite)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding([.top, .bottom], 10)
        .background(.mainBg)
    }
}

#Preview {
    DetailNavBar()
        .environmentObject(FavoritesScreenViewModel())
        .environmentObject(Router())
        .environmentObject(OrderViewModel())
}
