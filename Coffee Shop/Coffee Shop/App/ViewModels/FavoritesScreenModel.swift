import SwiftUI

class FavoritesScreenModel: ObservableObject {
    @Published var wishList: [ProductModel?] = []
    
}
