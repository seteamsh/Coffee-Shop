//
//  AppFlowScreen.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 21.08.2025.
//

import SwiftUI

enum AppFlowState {
    case Auth
    case Main
}


struct AppFlowScreen: View {
    @StateObject var favoritesScreenModel = FavoritesScreenModel()
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
