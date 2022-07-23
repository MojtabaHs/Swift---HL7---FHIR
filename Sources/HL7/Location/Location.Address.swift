extension Location {
    public struct Address: Codable, Hashable, Equatable {
        public let id: String
        public let use: Use
        public let type: `Type`
        public let text: String
        public let lines: [String]
        public let city: String
        public let district: String
        public let state: String
        public let postalCode: String
        public let country: String
        public let period: Period
    }
}
