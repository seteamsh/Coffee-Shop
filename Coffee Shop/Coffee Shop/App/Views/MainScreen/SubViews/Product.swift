import SwiftUI

struct Product: View {
    var product: ProductModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                CardImage(imageURL: product.image)
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(colors: [.mainBgGradientStart, .mainBgGradientEnd], startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: CGFloat(24.0), topTrailingRadius: CGFloat(12.0)))
                                .opacity(0.3)
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
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 14))
                        }
                        .frame(width: 51, height: 28)
                    }
                    Spacer()
                }
            }.frame(width: 140, height: 128)
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
                    ZStack {
                        Rectangle()
                            .fill(Color.brownNormal)
                            .frame(width: 32, height: 32)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Image(.productAdd)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 16, height: 16)
                        
                    }
                    
                }
                
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 12, trailing: 8))
        .frame(width: 156, height: 238)
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
            image: "https://raw.githubusercontent.com/seteamsh/Coffee-Shop-Product/refs/heads/main/caffeMocha.png"
        )
    )
}
