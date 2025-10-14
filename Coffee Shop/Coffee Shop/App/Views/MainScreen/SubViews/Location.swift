import SwiftUI

struct Location: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Location")
                .fontSora(size: 12, weight: .regular, color: .grayLighter)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                Text("Bilzen, Tanjungbalai")
                    .fontSora(size: 14, weight: .semibold, color: .whiteNormal)
                Image(.locationArrow)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .padding(EdgeInsets(top: 3.5, leading: 4, bottom: 0, trailing: 3.5))
                Spacer()
            }
        }
    }
}
