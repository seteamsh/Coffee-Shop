import SwiftUI

class DetailScreenModel: ObservableObject {
    @Published var isMore: Bool = false
    @Published var sizeSelected: Size?
    @Published var selectedSize: Size?
    var lineLimit: Int {
        isMore ? .max : 3
    }
    
    var sizes: [Size] = [
        Size(id: 1, text: "S"),
        Size(id: 2, text: "M"),
        Size(id: 3, text: "L")
    ]
    
    func toggleMore() {
        isMore.toggle()
    }
    
    func textMore() -> String {
        isMore ? ReadState.less.rawValue : ReadState.more.rawValue
    }
}
