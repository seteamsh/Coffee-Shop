import SwiftUI
import Kingfisher

struct CardImage: View {
    let imageURL: String
    var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder {
                Image(systemName: "photo")
            }
            .resizable()
    }
}
