import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var router: Router
    var body: some View {
        HStack(spacing: 16) {
            Button {
                router.push(.search)
            } label: {
                HStack(spacing: 0) {
                    Image(.searchLoop)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 8)
                    Text("Search coffee")
                        .font(Font.custom(.sora, size: 14))
                        .foregroundStyle(.grayLighter)
                }
                .frame(maxWidth: .infinity, maxHeight: 52)
            }
            .background(.blackLighter)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            Button {
                
            } label: {
                Image(.filter)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            .frame(width: 52, height: 52)
            .background(.brownNormal)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    SearchBar()
}
