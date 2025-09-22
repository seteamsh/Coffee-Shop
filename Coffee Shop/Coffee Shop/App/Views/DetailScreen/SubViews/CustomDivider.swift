import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.lightActive)
            .padding([.leading, .trailing], 16)
    }
}
