import SwiftUI


struct Banner: View {
    var body: some View {
        ZStack {
            Image(.banner)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack {
                        Rectangle()
                            .fill(.promoBanner)
                            .frame(width: 60, height: 26)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Promo")
                            .font(Font.custom(.sora, size: 14))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom, 8)
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(LinearGradient(colors: [Color.mainBgGradientEnd, Color.mainBgGradientStart], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .frame(width: 200, height: 27)
                            .padding(.top, 15)
                        Text("Buy one get")
                            .font(Font.custom(.sora, size: 32))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(LinearGradient(colors: [Color.mainBgGradientEnd, Color.mainBgGradientStart], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .frame(width: 149, height: 23)
                            .padding(.top, 15)
                        
                        Text("one FREE")
                            .font(Font.custom(.sora, size: 32))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.leading, 1)
                    }
                }
                .padding(EdgeInsets(top: 13, leading: 24, bottom: 13, trailing: 0))
                
                Spacer()
            }
        }
        .frame(height: 140)
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
    }
}
