import SwiftUI
import Kingfisher
struct DetailScreen: View {
    @StateObject var model = DetailScreenModel()
    @EnvironmentObject var orderModel: OrderModel

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                    VStack(spacing: 0) {
                        DetailNavBar()
                        CardImage(imageURL: orderModel.product?.image ?? "", width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
                        Details()
                            .padding([.top, .bottom], 16)
                        CustomDivider()
                            .padding(.bottom, 16)
                        DetailDescriptionView(model: model)
                        .padding(.bottom, 24)
                        ChoiceSize(model: model)
                            .padding(.bottom, 24)
                        Spacer()
                    }
                    .padding([.leading, .trailing], 24)
            }
            .background(Color.mainBg)
            DetailTapBar(model: model)
            .background(Color.mainBg)
        }
            .navigationBarBackButtonHidden()            
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
