import SwiftUI

struct CategorySlider: View {
    @ObservedObject var vm: MainViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(vm.getCategories()) { category in
                    CategorySliderButton(
                        name: category.name,
                        isActive: category == vm.categorySelected ? true : false
                    ){
                        vm.setCategorySelected(category: category)
                    }
                }
            }
        }
    }
}

#Preview {
    CategorySlider(vm: MainViewModel())
}
