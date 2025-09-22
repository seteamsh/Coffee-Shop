//
//  OrderTapBar.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 22.09.2025.
//

import SwiftUI

struct OrderTapBar: View {
    @EnvironmentObject var orderModel: OrderModel
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 165)
                .clipShape(
                    .rect(topLeadingRadius: 16, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 16))
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(.wallet)
                        .resizable()
                        .frame(width: 15.95, height: 14.73)
                        .padding(.trailing, 9.5)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Cash/Wallet")
                            .font(Font.custom(.sora, size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(.grayNormalActive)
                        Text("$ \(String(format: "%.2f", orderModel.totalAmount ?? 0.0))")
                            .font(Font.custom(.sora, size: 12))
                            .fontWeight(.semibold)
                            .foregroundStyle(.brownNormal)
                    }
                    Spacer()
                    Image(.down)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(EdgeInsets(top: 16, leading: 24, bottom: 12, trailing: 24))
                Button {
                    //mainModel.selectedProduct?.count = model.count
                    if orderModel.typeDelivery == nil {
                        return
                    } else {
                        print("\(String(describing: orderModel))")
                        router.push(.delivery)
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.brownNormal)
                            .frame(height: 56)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        Text("Buy Now")
                            .fontSora(size: 16, weight: .semibold, color: .white)
                    }
                }
                .padding(EdgeInsets(top: 16, leading: 24, bottom: 12, trailing: 24))
            }
        }
        .background(.mainBg)
    }
}
