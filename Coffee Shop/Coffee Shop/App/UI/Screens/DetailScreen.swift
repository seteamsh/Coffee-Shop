import SwiftUI

class DetailScreenModel: ObservableObject {
    @Published var isMore: Bool = false
    @Published var sizeSelected: Size?
    @Published var selectedSize: Size?
    var lineLimit: Int {
        isMore ? .max : 3
    }
//    func lineLimit() -> Int {
//        isMore ? .max: 3
//    }
    func toggleMore() {
        isMore.toggle()
    }
    func textMore() -> String {
        isMore ? ReadState.less.rawValue : ReadState.more.rawValue
    }
//    func activeToggle() {
//        isActive.toggle()
//    }
//    func colorActive(activeColor: Color, notActiveColor: Color) -> Color {
//        isActive ? activeColor : notActiveColor
//    }
    var sizes: [Size] = [
        Size(id: 1, text: "S"),
        Size(id: 2, text: "M"),
        Size(id: 3, text: "L")
    ]
}



struct DetailScreen: View {
    @StateObject var model = DetailScreenModel()
    @ObservedObject var mainModel: MainScreenModel
    var body: some View {
        VStack(spacing: 0, content: {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Button {
                                
                            } label: {
                                Image(.back)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)
                                

                            Spacer()
                            Text("Detail")
                                .font(Font.custom(.sora, size: 16))
                                .fontWeight(.semibold)
                                .foregroundStyle(.grayNormalActive)
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(.favorite)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(10)

                        }
                        .padding(.top, 24)
                        Image(mainModel.selectedProduct?.product?.image ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 327, height: 202, alignment: .center)
                        
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(mainModel.selectedProduct?.product?.name ?? "")
                                    .font(Font.custom(.sora, size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.grayNormalActive)
                                    .padding(.bottom, 4)
                                Text("Ice/Hot")
                                    .font(Font.custom(.sora, size: 12))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.grayLighter)
                                    .padding(.bottom,  16)
                                HStack(spacing: 0) {
                                    Image(.star)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text(mainModel.selectedProduct?.product?.rating ?? "")
                                        .font(Font.custom(.sora, size: 15))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.greyNormalHover)
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
                            .font(Font.custom(.sora, size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.grayNormalActive)
                            .padding(.bottom, 8)
                        Text("A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk. The foam on top, made from steamed milk, adds both texture and sweetness to the drink. Traditionally served in a ceramic cup, the cappuccino is known for its perfect balance between bold espresso and creamy milk.")
                            .font(Font.custom(.sora, size: 14))
                            .fontWeight(.light)
                            .foregroundStyle(.grayLighter)
                            .lineLimit(model.lineLimit)
                        HStack(spacing: 0) {
                            Spacer()
                            Button(action: {
                                model.toggleMore()
                            }, label: {
                                Text(model.textMore())
                                    .font(Font.custom(.sora, size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.brownNormal)
                            })
                        }
                        .padding(.bottom, 24)
                        Text("Size")
                            .font(Font.custom(.sora, size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.grayNormalActive)
                            .padding(.bottom, 16)
                        ChoiceSize(model: model, mainModel: mainModel)
                        Spacer()
                    }
                    
                    .padding([.leading, .trailing], 24)
                    .background(Color.mainBg)
                }
                TapBar(mainModel: mainModel, model: model)
                .background(Color.mainBg)
            }
        })
            .ignoresSafeArea(edges: .bottom)
            
    }
}

struct TapBar: View {
    @ObservedObject var mainModel: MainScreenModel
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
                        .font(Font.custom(.sora, size: 14))
                        .fontWeight(.regular)
                        .foregroundStyle(.greyLightHover)
                        .padding(.bottom, 4)
                    Text(mainModel.selectedProduct?.product?.price ?? "")
                        .font(Font.custom(.sora, size: 18))
                        .fontWeight(.semibold)
                        .foregroundStyle(.brownNormal)
                }
                Spacer()
                Button {
                    if model.selectedSize != nil {
                        mainModel.goToOrder()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.brownNormal)
                            .frame(width: 217, height: 56)
                            .clipShape(RoundedRectangle(cornerRadius: 16))

                        Text("Buy Now")
                            .font(Font.custom(.sora, size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                }

                    
            }
            
            .padding(EdgeInsets(top: 16, leading: 24, bottom: 12, trailing: 24))
            
        }
    }
}

struct ChoiceSize: View {
    @ObservedObject var model: DetailScreenModel
    @ObservedObject var mainModel: MainScreenModel
    var body: some View {
        HStack(spacing: 0) {
            ForEach(model.sizes) { size in
                ChoiceButton(isActive: model.selectedSize == size,
                             isLast: model.sizes.last == size,
                             size: size) {
                    model.selectedSize = size
                    mainModel.selectedProduct?.size = size
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
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(isActive ? .brownNormal : .grayNormalActive)
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
    DetailScreen(mainModel: MainScreenModel())
}
