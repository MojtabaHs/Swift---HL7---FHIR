extension Location.Address {
    public enum `Type`: Codable, Hashable, Equatable {
        case postal
        case physical
        case both
        case unknown(String)
        
        public var rawValue: String {
            switch self {
            case .postal: return "POSTAL"
            case .physical: return "PHYSICAL"
            case .both: return "BOTH"
            case .unknown(let value): return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            switch rawValue.uppercased() {
            case Self.postal.rawValue: self = .postal
            case Self.physical.rawValue: self = .physical
            case Self.both.rawValue: self = .both
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
