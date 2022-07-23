extension Location.Address {
    public enum Use: Codable, Hashable, Equatable {
        case home
        case work
        case temp
        case old
        case billing
        case unknown(String)
        
        public var rawValue: String {
            switch self {
            case .home: return "home"
            case .work: return "work"
            case .temp: return "temp"
            case .old: return "old"
            case .billing: return "billing"
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
            case Self.billing.rawValue: self = .billing
            default: self = .unknown(rawValue)
                assertionFailure("Unknown \(Swift.type(of: self)): \(rawValue)")
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }
}
