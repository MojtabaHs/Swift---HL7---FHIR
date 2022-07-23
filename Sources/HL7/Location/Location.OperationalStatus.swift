extension Location {
    public enum OperationalStatus: Codable, Hashable, Equatable {
        case closed
        case housekeeping
        case occupied
        case unoccupied
        case contaminated
        case isolate
        case unknown(String)
        
        public var rawValue: String {
            switch self {
            case .closed: return  "C"
            case .housekeeping: return  "H"
            case .occupied: return  "O"
            case .unoccupied: return  "U"
            case .contaminated: return  "K"
            case .isolate: return  "I"
            case .unknown(let value): return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            switch rawValue.uppercased() {
            case Self.closed.rawValue: self = .closed
            case Self.housekeeping.rawValue: self = .housekeeping
            case Self.occupied.rawValue: self = .occupied
            case Self.unoccupied.rawValue: self = .unoccupied
            case Self.contaminated.rawValue: self = .contaminated
            case Self.isolate.rawValue: self = .isolate
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
