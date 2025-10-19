import SwiftUI

struct Product: View {
    var product: ProductModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                CardImage(imageURL: product.image)
                    .frame(width: 140, height: 128)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                HStack(spacing: 0) {
                    Image(.star)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 12)
                        .padding(.trailing, 4)
                    Text("\(product.rating)")
                        .font(Font.custom(.sora, size: 8))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .padding(8)
                .frame(width: 51, height: 28)
                .background(LinearGradient(colors: [.mainBgGradientStart, .mainBgGradientEnd], startPoint: .bottomLeading, endPoint: .topTrailing).opacity(0.3))
                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: CGFloat(24.0), topTrailingRadius: CGFloat(12.0)))
            }
            Text(product.name)
                .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 0))
            Text(product.modificator)
                .fontSora(size: 12, weight: .regular, color: .grayLighter)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                Text("$ \(String(product.price))")
                    .fontSora(size: 16, weight: .semibold, color: .greyDarkActive)
                Spacer()
                Button {
                    
                } label: {
                    Image(.productAdd)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 16, height: 16)
                }
                .frame(width: 32, height: 32)
                .background(Color.brownNormal)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
        }
        .padding(8)
        .frame(width: 156)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Product(
        product: ProductModel(
            id: 1,
            name: "Caffe Mocha",
            modificator: "Deep Foam",
            description: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More",
            price: 4.53,
            rating: "4.8",
            image: "https://raw.githubusercontent.com/seteamsh/Coffee-Shop-Product/refs/heads/main/caffeMocha.png", category: [Category(id: 1, name: "Machiato")]
        )
    )
}
