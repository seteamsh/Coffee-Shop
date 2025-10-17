import SwiftUI

struct Discount: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 56)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16) .stroke(.categoryNotActive, lineWidth: 1))
            HStack(spacing: 0) {
                Image(.discount)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fill)
                    .padding(.trailing, 16)
                Text("1 Discount is Applies")
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.semibold)
                Spacer()
                Image(.right)
                    .resizable()
                    .frame(width: 21, height: 21)
                    .aspectRatio(contentMode: .fill)
            }.padding(EdgeInsets(top: 18, leading: 16, bottom: 18, trailing: 16))
        }
        
    }
}
