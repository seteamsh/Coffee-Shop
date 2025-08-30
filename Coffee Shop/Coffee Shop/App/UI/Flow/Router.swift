import SwiftUI

class Router: ObservableObject {
    @Published var path: [Screen] = []
    func push(_ screen: Screen) {
        path.append(screen)
    }
}
