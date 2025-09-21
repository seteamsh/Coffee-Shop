import SwiftUI

struct AuthScreen: View {
    var action: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                Image(.start)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -reader.frame(in: .global).minY)
                    .frame(width: SizeConstants.avatarWidth)
            }
            .frame(height: SizeConstants.avatarWidth)
            Spacer()
            Container {
                action()
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AuthScreen(action: {})
}

struct SizeConstants {
    static var avatarHeight: CGFloat {
        UIScreen.main.bounds.height / 2
    }
    static var avatarWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

