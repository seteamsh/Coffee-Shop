import SwiftUI
import Kingfisher

struct DetailScreen: View {
    //MARK: - Properties
    @StateObject var model = DetailScreenViewModel()
    @EnvironmentObject var orderModel: OrderViewModel

    //MARK: - Body
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
                        SelectedSize(model: model)
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
        .environmentObject(FavoritesScreenViewModel())
        .environmentObject(OrderViewModel())
}
