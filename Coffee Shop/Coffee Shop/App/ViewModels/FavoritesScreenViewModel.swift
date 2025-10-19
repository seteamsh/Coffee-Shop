import SwiftUI

class FavoritesScreenViewModel: ObservableObject {
    @Published var wishList: [ProductModel?] = []
    
}
