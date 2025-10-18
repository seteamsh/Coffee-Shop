import SwiftUI

struct PaymentSummary: View {
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        Text("Payment Summary")
            .font(Font.custom(.sora, size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(.grayNormalActive)
        HStack(spacing: 0) {
            Text("Price")
                .font(Font.custom(.sora, size: 14))
                .fontWeight(.regular)
                .foregroundStyle(.grayNormal)
            Spacer()
            Text("$ \(String(format: "%.2f", orderModel.totalAmount ?? 0.0))")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.grayNormalActive)
        }
        HStack(spacing: 0) {
            Text("Delivery Fee")
                .font(Font.custom(.sora, size: 14))
                .fontWeight(.regular)
                .foregroundStyle(.grayNormal)
            Spacer()
            Text("$2.00")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.regular)
                .foregroundStyle(.grayNormalActive)
                .padding(.trailing, 8)
            Text("$1.00")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.grayNormalActive)
        }
    }
}

#Preview {
    PaymentSummary()
        .environmentObject(OrderModel())
}
