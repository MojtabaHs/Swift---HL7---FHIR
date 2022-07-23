extension Location {
    public enum Mode: Codable, Hashable, Equatable {
        /// The Location resource represents a specific instance of a location (e.g. Operating Theatre 1A).
        case instance
        /// The Location represents a class of locations (e.g. Any Operating Theatre) although this class of locations could be constrained within a specific boundary (such as organization, or parent location, address etc.).
        case kind
        case unknown(String)
        
        public var rawValue: String {
            switch self {
            case .instance: return "instance"
            case .kind: return "kind"
            case .unknown(let value): return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            switch rawValue.uppercased() {
            case Self.instance.rawValue: self = .instance
            case Self.kind.rawValue: self = .kind
            default: self = .unknown(rawValue); assertionFailure("Unknown \(type(of: self)): \(rawValue)")
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }
}
