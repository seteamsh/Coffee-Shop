import SwiftUI

struct CardImage: View {
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}
