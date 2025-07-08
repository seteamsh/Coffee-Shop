//
//  AuthScreen.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 08.07.2025.
//

import SwiftUI

struct AuthScreen: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(.start)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 536)
                Spacer()
            }
            VStack(spacing: 0) {
                Spacer()
                Container()
            }
        }.ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    AuthScreen()
}

private struct Container: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.black, .black, .black, .black, .black.opacity(0)], startPoint: .bottom, endPoint: .top)
                )
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("Fall in Love with Coffee in Blissful Delight!")
                        .font(Font.custom(.sora, size: 32))
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)
                    Text("Welcome to our cozy coffee corner, where every cup is a delightful for you.")
                        .font(Font.custom(.sora, size: 14))
                        .foregroundStyle(.grayLighter)
                }
                .frame(width: 327, height: 194)
                .padding(EdgeInsets(top: 24, leading: 24, bottom: 32, trailing: 24))
                
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 327, height: 56)
                            .foregroundColor(.brownNormal)
                            .cornerRadius(16)
                        Text("Get Started")
                            .font(Font.custom(.sora, size: 16))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.bottom,  54)
            }
        }
        .frame(height: 360)
    }
}
