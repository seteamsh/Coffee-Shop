import SwiftUI

struct DetailDescriptionView: View {
    @ObservedObject var model: DetailScreenViewModel
    @EnvironmentObject var orderViewModel: OrderViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Description")
                .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
                .padding(.bottom, 8)
            Text(orderViewModel.getProduct().description)
                .fontSora(size: 14, weight: .light, color: .grayLighter)
                .lineLimit(model.lineLimit)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                Spacer()
                Button(action: {
                    model.toggleMore()
                }, label: {
                    Text(model.textMore())
                        .fontSora(size: 14, weight: .semibold, color: .brownNormal)

                })
            }
        }
        
    }
}
