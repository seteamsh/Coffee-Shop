import SwiftUI

struct CategorySlider: View {
    @ObservedObject var model: MainViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(model.categories) { category in
                    CategorySliderButton(isActive:
                                            category.category == model.categorySelected ? true : false,
                                         name: category
                    ){
                        model.categorySelected = category.category
                    }
                }
            }
        }
    }
}

#Preview {
    CategorySlider(model: MainViewModel())
}
