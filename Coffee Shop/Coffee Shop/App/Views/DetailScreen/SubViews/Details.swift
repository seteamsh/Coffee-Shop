//
//  Details.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 22.09.2025.
//

import SwiftUI

struct Details: View {
    @EnvironmentObject var orderModel: OrderViewModel
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text(orderModel.product?.name ?? "")
                    .fontSora(size: 20, weight: .semibold, color: .grayNormalActive)
                Text("Ice/Hot")
                    .fontSora(size: 12, weight: .regular, color: .grayLighter)
                    .padding(.bottom,  12)
                HStack(spacing: 0) {
                    Image(.star)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(orderModel.product?.rating ?? "")
                        .fontSora(size: 15, weight: .semibold, color: .greyNormalHover)
                    Text("(230)")
                        .font(Font.custom(.sora, size: 12))
                        .foregroundStyle(.grayLighter)
                }
            }
            Spacer()
            HStack(spacing: 12) {
                Superiority(logo: .fastDelivery)
                Superiority(logo: .qualityBean)
                Superiority(logo: .extraMilk)
            }
            .padding([.top, .bottom], 20)
        }
        .background(.mainBg)
    }
}

#Preview {
    Details()
        .environmentObject(OrderViewModel())
}
