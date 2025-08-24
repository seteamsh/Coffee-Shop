//
//  FavoritesScreen.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 17.08.2025.
//

import SwiftUI

struct FavoritesScreen: View {
    @Binding var wishList: [ProductModel?]
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                ForEach(wishList, id: \.self) { productModel in
                    WishCard(productModel: productModel)
                }
                Spacer()
            }
        }
    }
}

struct WishCard: View {
    var productModel: ProductModel?
    var body: some View {
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
        .swipeActions(edge: .trailing) {
            Button {
                
            } label: {
                Image(systemName: "trash")
            }

        }
        Divider()
    }
}
#Preview {
    FavoritesScreen(wishList: .constant([ProductModel(id: 1, name: "Caffe Mocha", description: "Ice/Hot", price: 3.3, rating: "4.5", image: "caffeMocha")]))
}
