enum ReithFont {
    case bold
    case regular
    case medium
    case light
    
    var name: String {
        switch self {
            case .bold:
                return "BBCReithSans-Bold"
            case .regular:
                return "BBCReithSans-Regular"
            case .medium:
                return "BBCReithSans-Medium"
            case .light:
                return "BBCReithSans-Light"
        }
    }
}
