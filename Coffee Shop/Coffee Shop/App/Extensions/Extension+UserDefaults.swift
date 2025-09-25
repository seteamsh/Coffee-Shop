import SwiftUI

extension UserDefaults {
    func saveFavoritesCoffee(_ coffee: [ProductModel?]) {
        if let encoded = try? JSONEncoder().encode(coffee) {
            self.set(encoded, forKey: "coffee")
        }
    }
    func loadFavoritesCoffee() -> [ProductModel] {
        if let data = self.data(forKey: "coffee") {
            let decoded = try? JSONDecoder().decode([ProductModel].self, from: data)
            if let decoded = decoded {
                return decoded
            }
        }
        return []
    }
}
