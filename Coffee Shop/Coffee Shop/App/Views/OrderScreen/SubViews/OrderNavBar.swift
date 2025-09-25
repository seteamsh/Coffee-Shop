import SwiftUI

struct OrderNavBar: View {
    @EnvironmentObject var router: Router
    var body: some View {
        HStack(spacing: 0) {
            Button {
                router.goBack()
            } label: {
                Image(.back)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .padding(10)
            
            Spacer()
            
            Text("Order")
                .fontSora(size: 16, weight: .semibold, color: .grayNormalActive)

                .padding(EdgeInsets(top: 12.5, leading: 0, bottom: 12.5, trailing: 0))
            
            Spacer()
            
            Rectangle()
                .fill(.mainBg)
                .frame(width: 24, height: 24)
                .padding(10)
        }
    }
}
