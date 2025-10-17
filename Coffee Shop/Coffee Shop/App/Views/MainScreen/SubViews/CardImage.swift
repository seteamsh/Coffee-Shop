import SwiftUI
import Kingfisher

struct CardImage: View {
    let imageURL: String
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder {
                Image(systemName: "photo")
            }
            .resizable()
            .frame(width: width, height: height)
    }
}
