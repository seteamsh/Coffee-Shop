import SwiftUI

struct MainScreen: View {
    @State var searhBar = ""
    var body: some View {
        ZStack {
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
                        
                }
                .frame(height: 238)
                Spacer()
            }
            VStack(spacing: 0) {
                Location()
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
                SearchBar(searhBar: $searhBar)
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
                Image(.banner)
                    .resizable()
                    .frame(height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color.brownNormal)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .frame(width: 87, height: 27)
                                Text("All Coffee")
                                    .font(Font.custom(.sora, size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .lineLimit(1)
                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            }
                        }
                        .padding(.trailing, 16)
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color.categoryNotActive)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .frame(width: 83, height: 29)
                                Text("Machiato")
                                    .font(Font.custom(.sora, size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.grayNormal)
                                    .lineLimit(1)
                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            }
                            
                        }
                        .padding(.trailing, 16)
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color.categoryNotActive)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .frame(height: 29)
                                Text("Latte")
                                    .font(Font.custom(.sora, size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.grayNormal)
                                    .lineLimit(1)
                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            }
                            
                        }
                        .padding(.trailing, 16)
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color.categoryNotActive)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .frame(height: 29)
                                Text("Americano")
                                    .font(Font.custom(.sora, size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.grayNormal)
                                    .lineLimit(1)
                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            }
                            
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                    Spacer()
                }
            }
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
                    .padding(.bottom, 8)
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
    }
}

struct SearchBar: View {
    @Binding var searhBar: String
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(.blackLighter)
                    .frame(height: 52)
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
