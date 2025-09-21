import SwiftUI

struct DetailScreen: View {
    @StateObject var model = DetailScreenModel()
    //@Binding var inputSelectedProduct: SelectedProduct?
    @EnvironmentObject var favoritesScreenModel: FavoritesScreenModel
    @EnvironmentObject var orderModel: OrderModel
    @EnvironmentObject var router: Router
    var isAdded: Bool {
        favoritesScreenModel.wishList.contains(orderModel.product)
    }
    var body: some View {
        VStack(spacing: 0, content: {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Button {
                                router.goBack()
                            } label: {
                                Image("back")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)
                                

                            Spacer()
                            Text("Detail")
                                .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
                            Spacer()
                            Button {
                                if isAdded { favoritesScreenModel.wishList.remove(at: favoritesScreenModel.wishList.firstIndex(of: orderModel.product)!) }
                                else {
                                    favoritesScreenModel.wishList.append(orderModel.product)
                                }
                                print("\(favoritesScreenModel.wishList)")
                            } label: {
                                Image(isAdded ? .addedToWishList : .favorite)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)

                        }
                        .padding(.top, 24)
                        
                        if let imageUrl = orderModel.product?.image, let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 327, height: 202, alignment: .center)
                                }
                            }
                        }
                        
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(orderModel.product?.name ?? "")
                                    .fontSora(size: 20, weight: .semibold, color: .grayNormalActive)
                                    .padding(.bottom, 4)
                                Text("Ice/Hot")
                                    .fontSora(size: 12, weight: .regular, color: .grayLighter)
                                    .padding(.bottom,  16)
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
                            HStack(spacing: 0) {
                                Superiority(logo: .fastDelivery)
                                    .padding(.trailing, 12)
                                Superiority(logo: .qualityBean)
                                    .padding(.trailing, 12)
                                Superiority(logo: .extraMilk)
                            }
                            .padding([.top, .bottom], 20)
                        }
                        .padding(.bottom, 16)
                        CustomDivider()
                        Text("Description")
                            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
                            .padding(.bottom, 8)
                        Text("A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk. The foam on top, made from steamed milk, adds both texture and sweetness to the drink. Traditionally served in a ceramic cup, the cappuccino is known for its perfect balance between bold espresso and creamy milk.")
                            .fontSora(size: 14, weight: .light, color: .grayLighter)
                            .lineLimit(model.lineLimit)
                        HStack(spacing: 0) {
                            Spacer()
                            Button(action: {
                                model.toggleMore()
                            }, label: {
                                Text(model.textMore())
                                    .fontSora(size: 14, weight: .semibold, color: .brownNormal)

                            })
                        }
                        .padding(.bottom, 24)
                        Text("Size")
                            .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
                            .padding(.bottom, 16)
                        ChoiceSize(model: model)
                        Spacer()
                    }
                    
                    .padding([.leading, .trailing], 24)
                    .background(Color.mainBg)
                }
                TapBar(model: model)
                .background(Color.mainBg)
            }
        })
            .navigationBarBackButtonHidden()
            //.ignoresSafeArea(edges: .bottom)
            
    }
}

struct TapBar: View {
    @EnvironmentObject var orderModel: OrderModel
    @EnvironmentObject var router: Router
    
    @ObservedObject var model: DetailScreenModel
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
                    Text("\(String(orderModel.product?.price ?? 0.0))")
                        .fontSora(size: 18, weight: .semibold, color: .brownNormal)
                }
                Spacer()
                Button {
                    if model.selectedSize == nil {
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

struct ChoiceSize: View {
    @ObservedObject var model: DetailScreenModel
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        HStack(spacing: 0) {
            ForEach(model.sizes) { size in
                ChoiceButton(isActive: model.selectedSize == size,
                             isLast: model.sizes.last == size,
                             size: size) {
                    model.selectedSize = size
                    orderModel.size = size
                }
            }
        }
    }
}

struct ChoiceButton: View {
    var isActive: Bool
    var isLast: Bool
    var size: Size
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 96, height: 41)
                    .foregroundStyle(isActive ? .brownLight : .white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(isActive ? .brownNormal : .lightActive, lineWidth: 1))
                Text(size.text)
                    .fontSora(size: 14, weight: .regular, color: isActive ? .brownNormal : .grayNormalActive)
            }
        }.padding(.trailing, isLast ? 0 : 16)

    }
}

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.lightActive)
            .padding([.leading, .trailing], 16)
    }
}

enum ReadState: String {
    case more = "Read more"
    case less = "Read less"
}

enum SuperiorityLogo: String {
    case fastDelivery
    case qualityBean
    case extraMilk
    
}
struct Superiority: View {
    var logo: SuperiorityLogo
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .foregroundStyle(.categoryNotActive)
                .opacity(0.35)
            Image(logo.rawValue)
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}



#Preview {
    DetailScreen()
        .environmentObject(FavoritesScreenModel())
        .environmentObject(OrderModel())
}
