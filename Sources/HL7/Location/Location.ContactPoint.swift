extension Location {
    public struct ContactPoint: Codable, Hashable, Equatable {
        public let system: System
        public let value: String
        public let use: Use
        public let rank: UInt
        public let period: Period
    }
}
