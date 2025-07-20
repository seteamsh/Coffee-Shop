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
                Banner()
                Category()
            }
        }
        .background(Color.mainBg)
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

struct Banner: View {
    var body: some View {
        Image(.banner)
            .resizable()
            .frame(height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
    }
}

///

struct CategorySlider: View {
    @State var isActive: CategorySelectedState = .active
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(categories) { category in
                    switch isActive {
                    case .active:
                        CategorySliderActiveButton(name: category)
                    case .inActive:
                        CategorySliderNotActiveButton(name: category)
                    }
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
    }
}

struct CategorySliderActiveButton: View {
    var name: CategoryModel
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                Rectangle()
                    .fill(Color.brownNormal)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(width: 87, height: 27)
                Text(name.name)
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            }
        }
        .padding(.trailing, 16)
    }
}

struct CategorySliderNotActiveButton: View {
    var name: CategoryModel
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                Rectangle()
                    .fill(Color.categoryNotActive)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(height: 29)
                Text(name.name)
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(.grayNormal)
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            }
            
        }
        .padding(.trailing, 16)
    }
}

struct Product: View {
    var Name: String
    var description: String
    var rating: Double
    var price: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image(.caffeMocha)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
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
                                Text("4.8")
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
            Text("Caffe Mocha")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.grayNormalActive)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 0))
            Text("Deep Foam")
                .font(Font.custom(.sora, size: 12))
                .fontWeight(.regular)
                .foregroundStyle(.grayLighter)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                Text("$ 4.53")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.greyDarkActive)
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

struct Category: View {
    var body: some View {
        CategorySlider()
            .padding(.bottom, 16)
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.fixed(156), spacing: 15),
                GridItem(.fixed(156))
            ], spacing: 24) {
                Product(Name: "", description: "", rating: 2.1, price: "")
                Product(Name: "", description: "", rating: 2.1, price: "")
                Product(Name: "", description: "", rating: 2.1, price: "")
                Product(Name: "", description: "", rating: 2.1, price: "")
            }.padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
        }
    }
}

#Preview {
    MainScreen()
}
