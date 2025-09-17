//
//  SearchScreen.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 16.08.2025.
//

import SwiftUI

struct SearchScreen: View {
    @State var text: String = ""
    var body: some View {
        VStack(spacing: 0) {
            Search(searchBar: $text)
                .padding(.top, 24)
            Spacer()
        }
        .background(LinearGradient(
            stops: [
                Gradient.Stop(color: .mainBgGradientEnd, location: 0.2),
                Gradient.Stop(color: .mainBgGradientStart, location: 1)
                ],
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        ))
        
        .navigationBarBackButtonHidden()
    }
}

struct Search: View {
    @Binding var searchBar: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                dismiss()
            }, label: {
                Image(.locationArrow)
                    .resizable()
                    .frame(width: 30, height: 15)
                    .rotationEffect(.degrees(90))
            })
                .padding(.trailing, 10)
            ZStack {
                Rectangle()
                    .fill(.blackLighter)
                    .frame(height: 52)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                HStack(spacing: 0) {
                    Image(.searchLoop)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 8)
                        
                    TextField(text: $searchBar) {
                        Text("Search coffee")
                            .fontSora(size: 14, weight: .regular, color: .grayLighter)
                    }                    
                    .font(Font.custom(.sora, size: 14))
                    .foregroundStyle(.white)
                    .frame(width: 207, height: 17)
                    
                }
                .background(.blackLighter)
                .padding(EdgeInsets(top: 17.5, leading: 16, bottom: 17.5, trailing: 0))
            }
            ZStack {
                Rectangle()
                    .fill(.brownNormal)
                    .frame(width: 52, height: 52)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Image(.filter)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    SearchScreen()
}
