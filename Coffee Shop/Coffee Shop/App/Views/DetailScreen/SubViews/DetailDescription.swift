import SwiftUI

struct DetailDescriptionView: View {
    @ObservedObject var model: DetailScreenViewModel
    @EnvironmentObject var orderModel: OrderViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Description")
                .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)
                .padding(.bottom, 8)
            Text("A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk. The foam on top, made from steamed milk, adds both texture and sweetness to the drink. Traditionally served in a ceramic cup, the cappuccino is known for its perfect balance between bold espresso and creamy milk.")
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
