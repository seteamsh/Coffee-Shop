import SwiftUI

struct CategorySliderButton: View {
    var isActive: Bool
    var name: CategoryModel
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
                Text(name.name)
                    .fontSora(size: 14, weight: .regular, color: isActive ? Color.white : Color.grayNormal)
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                    .background(isActive ? Color.brownNormal : Color.categoryNotActive)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(height: 29)
        }
    }
}

#Preview {
    CategorySliderButton(isActive: true, name: CategoryModel(id: 1, name: "fd", category: .americano) ) {
        
    }
}
