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
                        CardImage(imageURL: orderModel.product?.image ?? "")
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
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

#Preview {
    DetailScreen()
        .environmentObject(FavoritesScreenModel())
        .environmentObject(OrderModel())
}
