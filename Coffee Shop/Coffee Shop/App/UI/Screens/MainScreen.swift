import SwiftUI

class MainScreenModel: ObservableObject {
    @Published var searchBar = ""
    @Published var categorySelected: CategorySelected = .all
    @Published var selectedProduct: SelectedProduct?
    @Environment(\.dismiss) var dismiss
    var filteredProducts: [ProductModel] {
        get {
            if categorySelected == .all {
                return products
            } else {
                return products.filter { $0.category.contains(categorySelected) }
            }
        }
    }
    
    var categories = [
        CategoryModel(id: 1, name: "All Coffee", category: .all),
        CategoryModel(id: 2, name: "Machiato", category: .machiato),
        CategoryModel(id: 3, name: "Latte", category: .latte),
        CategoryModel(id: 4, name: "Americano", category: .americano)
    ]
    
    
    var products = [
        ProductModel(id: 1, name: "Caffe Mocha", description: "Deep Foam", price: 4.53, rating: "4.8", image: "caffeMocha", category: [.all, .machiato]),
        ProductModel(id: 2, name: "Flat White", description: "Espresso", price: 3.53, rating: "4.8", image: "flatWhite", category:  [.all, .americano]),
        ProductModel(id: 3, name: "Mocha Fusion", description: "Ice/Hot", price: 7.53, rating: "4.8", image: "mochaFusi", category:  [.all, .machiato]),
        ProductModel(id: 4, name: "Caffe Panna", description: "Ice/Hot", price: 5.53, rating: "4.8", image: "caffePanna", category:  [.all, .latte])
    ]
}

struct MainScreen: View {
    @StateObject var model = MainScreenModel()
    @StateObject var router = Router()
    @StateObject var orderModel = OrderModel()
    var body: some View {
        NavigationStack(path: $router.path) {
            ScrollView(.vertical) {
                ZStack {
                    VStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .mainBgGradientEnd, location: 0.2),
                                            Gradient.Stop(color: .mainBgGradientStart, location: 1)
                                        ],
                                        startPoint: .bottomLeading,
                                        endPoint: .topTrailing
                                    )
                                )
                            
                        }
                        .frame(height: 238)
                        Spacer()
                    }
                    VStack(spacing: 0) {
                        Location()
                            .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
                        Button(action: {
                            router.push(.search)
                        }, label: {
                            SearchBarView()
                        })
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
                        Banner()
                        Category(model: model)
                            .navigationDestination(for: Screen.self) { screen in
                                switch screen {
                                case .details:
                                    DetailScreen()
                                case .delivery:
                                    DeliveryScreen()
                                case .order:
                                    OrderScreen()
                                case .main:
                                    EmptyView()
                                case .search:
                                    SearchScreen()
                                }
                            }
                    }
                }
                .background(Color.mainBg)
                
            }
            
        }
        .environmentObject(router)
        .environmentObject(orderModel)
    }
}

struct Location: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Location")
                .font(Font.custom(.sora, size: 12))
                .foregroundStyle(.grayLighter)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                Text("Bilzen, Tanjungbalai")
                    .font(Font.custom(.sora, size: 14))
                    .foregroundStyle(.whiteNormal)
                    .fontWeight(.semibold)
                Image(.locationArrow)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .padding(EdgeInsets(top: 3.5, leading: 4, bottom: 0, trailing: 3.5))
                Spacer()
            }
            .frame(width: 327)
        }
    }
}

struct SearchBarView: View {
    var body: some View {
        HStack(spacing: 0) {
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
                    Text("Search coffee")
                        .font(Font.custom(.sora, size: 14))
                        .foregroundStyle(.grayLighter)
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

struct Banner: View {
    var body: some View {
        ZStack {
            Image(.banner)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack {
                        Rectangle()
                            .fill(.promoBanner)
                            .frame(width: 60, height: 26)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Promo")
                            .font(Font.custom(.sora, size: 14))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom, 8)
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(LinearGradient(colors: [Color.mainBgGradientEnd, Color.mainBgGradientStart], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .frame(width: 200, height: 27)
                            .padding(.top, 15)
                        Text("Buy one get")
                            .font(Font.custom(.sora, size: 32))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(LinearGradient(colors: [Color.mainBgGradientEnd, Color.mainBgGradientStart], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .frame(width: 149, height: 23)
                            .padding(.top, 15)
                        
                        Text("one FREE")
                            .font(Font.custom(.sora, size: 32))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.leading, 1)
                    }
                }
                .padding(EdgeInsets(top: 13, leading: 24, bottom: 13, trailing: 0))
                
                Spacer()
            }
        }
        .frame(height: 140)
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
    }
}

///

struct CategorySlider: View {
    @ObservedObject var model: MainScreenModel
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



struct Product: View {
    var product: ProductModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(colors: [.mainBgGradientStart, .mainBgGradientEnd], startPoint: .bottomLeading, endPoint: .topTrailing))
                            
                                .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: CGFloat(24.0), topTrailingRadius: CGFloat(12.0)))
                                .opacity(0.3)
                            HStack(spacing: 0) {
                                Image(.star)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 12, height: 12)
                                    .padding(.trailing, 4)
                                Text("\(product.rating)")
                                    .font(Font.custom(.sora, size: 8))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                            }
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 14))
                        }
                        .frame(width: 51, height: 28)
                    }
                    Spacer()
                }
            }.frame(width: 140, height: 128)
            Text(product.name)
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.grayNormalActive)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 4, trailing: 0))
            Text(product.description)
                .font(Font.custom(.sora, size: 12))
                .fontWeight(.regular)
                .foregroundStyle(.grayLighter)
                .padding(.bottom, 8)
            HStack(spacing: 0) {
                Text("$ \(String(product.price))")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.greyDarkActive)
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color.brownNormal)
                            .frame(width: 32, height: 32)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Image(.productAdd)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 16, height: 16)
                        
                    }
                    
                }
                
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 12, trailing: 8))
        .frame(width: 156, height: 238)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
///////////////////////////////////////////////////////////
struct Category: View {
    @ObservedObject var model: MainScreenModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var orderModel: OrderModel
    var body: some View {
        CategorySlider(model: model)
        LazyVGrid(columns: [
            GridItem(.fixed(156), spacing: 20),
            GridItem(.fixed(156))
        ], spacing: 24) {
            ForEach(model.filteredProducts) { product in
                Button {
                    //if orderModel.product == nil {
                        orderModel.product = product
                    //}
                    router.push(.details)
                } label: {
                    Product(product: product)
                }
                
            }
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
    }
}

struct CategorySliderButton: View {
    var isActive: Bool
    var isLast: Bool
    var name: CategoryModel
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .fill(isActive ? Color.brownNormal : Color.categoryNotActive)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(height: 29)
                Text(name.name)
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(isActive ? Color.white : Color.grayNormal)
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            }
            
        }
        .padding(.trailing, isLast ? 0 : 16)
    }
}

#Preview {
    MainScreen()
        .environmentObject(FavoritesScreenModel())
}
