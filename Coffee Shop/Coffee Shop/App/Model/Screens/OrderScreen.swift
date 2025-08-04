//
//  OrderScreen.swift
//  Coffee Shop
//
//  Created by Temirlan Zhumashov on 04.08.2025.
//

import SwiftUI
class OrderScreenModel: ObservableObject {
    @Published var SelectedTypeOrder: OrderType?
}

struct OrderScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Image(.back)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(10)
                
                Spacer()

                Text("Detail")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.grayNormalActive)
                    .padding(EdgeInsets(top: 12.5, leading: 0, bottom: 12.5, trailing: 0))
                
                Spacer()
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 24, height: 24)
                    .padding(10)
            }
            .padding(.top, 24)
            OrderType()
            Spacer()
        }
        .padding([.leading, .trailing], 24)
    }
}

struct OrderType: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.categoryNotActive)
            HStack(spacing: 0) {
                OrderTypeButton(isActive: true, text: "Deliver") {
                    
                }
                OrderTypeButton(isActive: false, text: "Pick Up") {
                    
                }
            }
            
        }
        .frame(height: 43)
    }
}
struct OrderTypeButton: View {
    var isActive: Bool
    var text: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 150, height: 34)
                    .foregroundStyle(isActive ? .brownNormal : .categoryNotActive)
                Text(text)
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(isActive ? .semibold : .regular)
                    .foregroundStyle(isActive ? .white : .grayNormalActive)
            }
        }
    }
}

#Preview {
    OrderScreen()
}
