import SwiftUI

enum CustomFonts: String {
    case sora = "Sora"
}


extension Font {
    static func custom(_ fontName: CustomFonts, size: Double) -> Font {
        Font.custom(fontName.rawValue, size: size)
    }
}
