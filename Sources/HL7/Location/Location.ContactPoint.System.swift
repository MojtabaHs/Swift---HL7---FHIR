extension Location.ContactPoint {
    public enum System: Codable, Hashable, Equatable {
        case phone
        case fax
        case email
        case pager
        case url
        case sms
        case other
        case unknown(String)
        
        public var rawValue: String {
            switch self {
            case .phone: return "phone"
            case .fax: return "fax"
            case .email: return "email"
            case .pager: return "pager"
            case .url: return "url"
            case .sms: return "sms"
            case .other: return "other"
            case .unknown(let value): return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            switch rawValue.uppercased() {
            case Self.phone.rawValue: self = .phone
            case Self.fax.rawValue: self = .fax
            case Self.email.rawValue: self = .email
            case Self.pager.rawValue: self = .pager
            case Self.url.rawValue: self = .url
            case Self.sms.rawValue: self = .sms
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
