import SwiftUI

struct DetailTapBar: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 118)
                .clipShape(
                    .rect(topLeadingRadius: 16, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 16))
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("Price")
                        .fontSora(size: 14, weight: .regular, color: .greyLightHover)
                        .padding(.bottom, 4)
                    Text("\(String(orderViewModel.getProduct().price))")
                        .fontSora(size: 18, weight: .semibold, color: .brownNormal)
                }
                Spacer()
                Button {
                    if orderViewModel.getSize() == nil {
                        return
                    } else {
                        router.push(.order)
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.brownNormal)
                            .frame(width: 217, height: 56)
                            .clipShape(RoundedRectangle(cornerRadius: 16))

                        Text("Buy Now")
                            .fontSora(size: 16, weight: .semibold, color: .white)
                    }
                }

                    
            }
            
            .padding(EdgeInsets(top: 16, leading: 24, bottom: 12, trailing: 24))
            
        }
    }
}
