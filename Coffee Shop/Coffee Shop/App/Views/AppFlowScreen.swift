import SwiftUI

enum AppFlowState {
    case Auth
    case Main
}


struct AppFlowScreen: View {
    @StateObject var favoritesScreenModel = FavoritesScreenViewModel()
    @State var appFlowState: AppFlowState = .Auth
    
    var body: some View {
        switch appFlowState {
        case .Auth:
            AuthScreen() {
                appFlowState = .Main
            }
        case .Main:
            CustomTabView()
                .environmentObject(favoritesScreenModel)
        }
    }
}

#Preview {
    AppFlowScreen()
}
