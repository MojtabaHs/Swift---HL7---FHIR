extension Location {
    public enum `Type`: Codable, Hashable, Equatable {
        /// A collection of buildings or other locations such as a site or a campus.
        case site
        /// Any Building or structure. This may contain rooms, corridors, wings, etc. It might not have walls, or a roof, but is considered a defined/allocated space.
        case building
        /// A Wing within a Building, this often contains levels, rooms and corridors.
        case wing
        /// A Ward is a section of a medical facility that may contain rooms and other types of location.
        case ward
        /// A Level in a multi-level Building/Structure.
        case level
        /// Any corridor within a Building, that may connect rooms.
        case corridor
        /// A space that is allocated as a room, it may have walls/roof etc., but does not require these.
        case room
        /// A space that is allocated for sleeping/laying on. This is not the physical bed/trolley that may be moved about, but the space it may occupy.
        case bed
        /// A means of transportation.
        case vehicle
        /// A residential dwelling. Usually used to reference a location that a person/patient may reside.
        case house
        /// A container that can store goods, equipment, medications or other items.
        case cabinet
        /// A defined path to travel between 2 points that has a known name.
        case road
        /// A defined physical boundary of something, such as a flood risk zone, region, postcode
        case area
        /// A wide scope that covers a conceptual domain, such as a Nation (Country wide community or Federal Government - e.g. Ministry of Health),
        /// Province or State (community or Government), Business (throughout the enterprise),
        /// Nation with a business scope of an agency (e.g. CDC, FDA etc.) or a Business segment (UK Pharmacy), not just a physical boundary
        case jurisdiction
        case unknown(String)
        
        public var rawValue: String {
            switch self {
            case .site: return "si"
            case .building: return "bu"
            case .wing: return "wi"
            case .ward: return "wa"
            case .level: return "lvl"
            case .corridor: return "co"
            case .room: return "ro"
            case .bed: return "bd"
            case .vehicle: return "ve"
            case .house: return "ho"
            case .cabinet: return "ca"
            case .road: return "rd"
            case .area: return "area"
            case .jurisdiction: return "jdn"
            case .unknown(let value): return value
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            switch rawValue.uppercased() {
            case Self.site.rawValue: self = .site
            case Self.building.rawValue: self = .building
            case Self.wing.rawValue: self = .wing
            case Self.ward.rawValue: self = .ward
            case Self.level.rawValue: self = .level
            case Self.corridor.rawValue: self = .corridor
            case Self.room.rawValue: self = .room
            case Self.bed.rawValue: self = .bed
            case Self.vehicle.rawValue: self = .vehicle
            case Self.house.rawValue: self = .house
            case Self.cabinet.rawValue: self = .cabinet
            case Self.road.rawValue: self = .road
            case Self.area.rawValue: self = .area
            case Self.jurisdiction.rawValue: self = .jurisdiction
            default: self = .unknown(rawValue); assertionFailure("Unknown \(type(of: self)): \(rawValue)")
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }
}
