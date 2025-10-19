//
//  OrderTapBar.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 22.09.2025.
//

import SwiftUI

struct OrderTapBar: View {
    @EnvironmentObject var orderModel: OrderViewModel
    @EnvironmentObject var router: Router
    var body: some View {
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
                OrangeButton(text: "Buy Now", width: .infinity, height: 56) {
                        print("\(String(describing: orderModel))")
                        router.push(.delivery)
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.15)
            .background(.white)
            .clipShape(
                .rect(topLeadingRadius: 16, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 16))
    }
}

#Preview {
    OrderTapBar()
        .environmentObject(OrderViewModel())
}
