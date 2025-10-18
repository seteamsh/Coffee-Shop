import SwiftUI

struct TypeCountBtn: View {
    var type: TypeCountButton
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 24, height: 24)
                    .overlay(Circle().stroke(.grayLighter, lineWidth: 1))
                Image(type.rawValue)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}

#Preview {
    TypeCountBtn(type: .activeMinus, action: {})
}
