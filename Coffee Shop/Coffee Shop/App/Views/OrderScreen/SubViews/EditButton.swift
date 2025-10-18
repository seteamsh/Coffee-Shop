import SwiftUI

struct EditButton: View {
    var editType: EditButtons
    var body: some View {
        Button {
            
        } label: {
            Image("\(editType)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 14, height: 14)
                .padding(.trailing, 4)
            
            Text(editType.rawValue)
                .font(Font.custom(.sora, size: 12))
                .fontWeight(.regular)
                .foregroundStyle(.grayNormal)
        }
        .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
        .background(.white)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16) .stroke(.lightActive, lineWidth: 1))
    }
}

#Preview {
    EditButton(editType: .edit)
}
