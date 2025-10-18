import SwiftUI

class OrderScreenModel: ObservableObject {
    
    //MARK: - Properties
    private var selectedTypeOrder: DeliveryType = .devlier // Может не обновлять в будущем, иметь ввиду поменять на @Published privat(set) var
    private var count = 1 // В будущем поменять на @Published privat(set) var, так как сейчас обновляется из за других published
    
    //MARK: - Methods
    var isActiveMinus: Bool {
        count == 1 ? false : true
    }
    
    //MARK: SelectedTypeOrder Methods
    func setSelectedTypeOrder(_ type: DeliveryType) {
        selectedTypeOrder = type
    }
    func getSelectedTypeOrder() -> DeliveryType {
        return selectedTypeOrder
    }
    
    //MARK: Count Methods
    func increaseCount() {
        count += 1
    }
    func decreaseCount() {
        if count > 1 {
            count -= 1
        }
    }
    func getCount() -> Int {
        return count
    }
}

    //MARK: - Enums
enum DeliveryType: String {
    case devlier = "Devlier"
    case pickUp = "Pick Up"
}

enum EditButtons: String {
    case edit = "Edit Address"
    case note = "Add Note"
}
