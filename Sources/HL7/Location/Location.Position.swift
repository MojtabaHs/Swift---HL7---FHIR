extension Location {
    public struct Position: Codable, Hashable, Equatable {
        /// Longitude with WGS84 datum
        public let longitude: Double
        /// Latitude with WGS84 datum
        public let latitude: Double
        /// Altitude with WGS84 datum
        public let altitude: Double
    }
}
