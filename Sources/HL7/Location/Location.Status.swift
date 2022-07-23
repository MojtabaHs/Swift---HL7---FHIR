extension Location {
    public enum Status: Codable, Hashable, Equatable {
        /// The location is operational
        case active
        /// The location is temporarily closed
        case suspended
        /// The location is no longer used
        case inactive
        /// Unknown state
        case unknown(String)
        
        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .suspended: return "suspended"
            case .inactive: return "inactive"
            case .unknown(let value): return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            switch rawValue.uppercased() {
            case Self.active.rawValue: self = .active
            case Self.suspended.rawValue: self = .suspended
            case Self.inactive.rawValue: self = .inactive
            default: self = .unknown(rawValue); assertionFailure("Unknown \(type(of: self)): \(rawValue)")
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }
}
