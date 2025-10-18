import SwiftUI

class DetailScreenModel: ObservableObject {
    @Published var isMore: Bool = false
    @Published var selectedSize: SizeOfCup?
    var lineLimit: Int {
        isMore ? .max : 3
    }
    
    func toggleMore() {
        isMore.toggle()
    }
    
    func textMore() -> String {
        isMore ? ReadState.less.rawValue : ReadState.more.rawValue
    }
}
