class MockProductService: ProductServiceProtocol {
    func getProducts() -> [ProductModel] {
        return [
            ProductModel(id: 1, name: "Caffe Mocha", description: "Deep Foam", price: 4.53, rating: "4.8", image: "caffeMocha", category: [.all, .machiato]),
            ProductModel(id: 2, name: "Flat White", description: "Espresso", price: 3.53, rating: "4.8", image: "flatWhite", category:  [.all, .americano]),
            ProductModel(id: 3, name: "Mocha Fusion", description: "Ice/Hot", price: 7.53, rating: "4.8", image: "mochaFusi", category:  [.all, .machiato]),
            ProductModel(id: 4, name: "Caffe Panna", description: "Ice/Hot", price: 5.53, rating: "4.8", image: "caffePanna", category:  [.all, .latte])
        ]
    }
}
