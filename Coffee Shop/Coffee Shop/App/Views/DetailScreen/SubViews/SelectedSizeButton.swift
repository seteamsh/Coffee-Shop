import SwiftUI

struct SelectedSizeButton: View {
    var isActive: Bool
    var size: SizeOfCup
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
                Text(size.rawValue)
                    .fontSora(size: 14, weight: .regular, color: isActive ? .brownNormal : .grayNormalActive)
            }
        }

    }
}

#Preview {
    SelectedSizeButton(isActive: true, size: SizeOfCup.L) {}
}
