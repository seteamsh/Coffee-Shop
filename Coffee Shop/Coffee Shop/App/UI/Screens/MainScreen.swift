import SwiftUI

struct MainScreen: View {
    @State var searhBar = ""
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .mainBgGradientEnd, location: 0.2),
                                Gradient.Stop(color: .mainBgGradientStart, location: 1)
                                ],
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        )
                    )
                    
                VStack {
                    Location()
                    SearchBar(searhBar: $searhBar)
                    Spacer()
                }
            }
            .frame(height: 280)
            Spacer()
        }
    }
}

struct Banner: View {
    var body: some View {
        Image(.banner)
    }
}

struct Location: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                Text("Location")
                    .font(Font.custom(.sora, size: 12))
                    .foregroundStyle(.grayLighter)
                    .padding(.bottom, 11.5)
                HStack(spacing: 0) {
                    Text("Bilzen, Tanjungbalai")
                        .font(Font.custom(.sora, size: 14))
                        .foregroundStyle(.whiteNormal)
                        .fontWeight(.semibold)
                    Image(.locationArrow)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14)
                        .padding(EdgeInsets(top: 3.5, leading: 4, bottom: 0, trailing: 3.5))
                    Spacer()
                }
                .frame(width: 327)
            }
            
        .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 0))
    }
}

struct SearchBar: View {
    @Binding var searhBar: String
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(.blackLighter)
                    .frame(width: 259, height: 52)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                HStack(spacing: 0) {
                    Image(.searchLoop)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 8)
                        
                    TextField(text: $searhBar) {
                        Text("Search coffee")
                            .font(Font.custom(.sora, size: 14))
                            .foregroundStyle(.grayLighter)
                    }
                    .font(Font.custom(.sora, size: 14))
                    .frame(width: 207, height: 17)
                    
                }
                .background(.blackLighter)
                .padding(EdgeInsets(top: 17.5, leading: 16, bottom: 17.5, trailing: 0))
            }
            ZStack {
                Rectangle()
                    .fill(.brownNormal)
                    .frame(width: 52, height: 52)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Image(.filter)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    MainScreen()
}
