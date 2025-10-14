import SwiftUI


struct Banner: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Image(.banner)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Promo")
                    .font(Font.custom(.sora, size: 14))
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .frame(width: 60, height: 26)
                    .background(.promoBanner)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom, 8)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(LinearGradient(colors: [Color.mainBgGradientEnd, Color.mainBgGradientStart], startPoint: .bottomLeading, endPoint: .topTrailing))
                        .frame(width: 200, height: 27)
                        .padding(.top, 17)
                    Text("Buy one get")
                        .font(Font.custom(.sora, size: 32))
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.leading, 1)
                }
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(LinearGradient(colors: [Color.mainBgGradientEnd, Color.mainBgGradientStart], startPoint: .bottomLeading, endPoint: .topTrailing))
                        .frame(width: 150, height: 23)
                        .padding(.top, 12)
                    
                    Text("one FREE")
                        .font(Font.custom(.sora, size: 32))
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.leading, 1)
                }
            }
            .padding(.leading, 24)
        }
    }
}

#Preview {
    Banner()
}
