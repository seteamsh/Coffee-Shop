import SwiftUI

final class DetailScreenViewModel: ObservableObject {
    @Published private(set) var isMore: Bool = false
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
