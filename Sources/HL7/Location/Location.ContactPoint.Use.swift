extension Location.ContactPoint {
    public enum Use: Codable, Hashable, Equatable {
        case home
        case work
        case temp
        case old
        case mobile
        case other
        case unknown(String)

        public var rawValue: String {
            switch self {
            case .home: return "home"
            case .work: return "work"
            case .temp: return "temp"
            case .old: return "old"
            case .mobile: return "mobile"
            case .other: return "other"
            case .unknown(let value): return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            switch rawValue.uppercased() {
            case Self.home.rawValue: self = .home
            case Self.work.rawValue: self = .work
            case Self.temp.rawValue: self = .temp
            case Self.old.rawValue: self = .old
            case Self.mobile.rawValue: self = .mobile
            case Self.other.rawValue: self = .other
            default: self = .unknown(rawValue); assertionFailure("Unknown \(type(of: self)): \(rawValue)")
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }
}
