import SwiftUI

class OrderScreenModel: ObservableObject {
    @Published var selectedTypeOrder: DeliveryType = .devlier
    @Published var selectedEditButton: EditTypeButton?
    @Published var count = 1

    var editButtons = [
        EditTypeButton(id: 1, name: "Edit Address", image: "edit"),
        EditTypeButton(id: 2, name: "Add note", image: "note")
        ]
    var isActiveMinus: Bool {
        count == 1 ? false : true
    }
    func increaseCount() {
        if count == 1 {
            return
        } else if count > 1 {
            count -= 1
        }
    }
}
