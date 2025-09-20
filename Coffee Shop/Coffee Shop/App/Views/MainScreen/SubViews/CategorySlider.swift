import SwiftUI

struct CategorySlider: View {
    @ObservedObject var model: MainViewModel
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(model.categories) { category in
                    CategorySliderButton(isActive:
                                            category.category == model.categorySelected ? true : false,
                                         isLast:
                                            model.categories.lastIndex(of: category) == model.categories.count - 1 ? true : false,
                                         name: category
                    ){
                        model.categorySelected = category.category
                    }
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 24, bottom: 16, trailing: 24))
    }
}
