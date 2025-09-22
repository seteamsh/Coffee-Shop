import SwiftUI

struct ChoiceButton: View {
    var isActive: Bool
    var isLast: Bool
    var size: Size
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 96, height: 41)
                    .foregroundStyle(isActive ? .brownLight : .white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(isActive ? .brownNormal : .lightActive, lineWidth: 1))
                Text(size.text)
                    .fontSora(size: 14, weight: .regular, color: isActive ? .brownNormal : .grayNormalActive)
            }
        }.padding(.trailing, isLast ? 0 : 16)

    }
}
