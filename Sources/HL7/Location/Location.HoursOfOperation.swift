import Foundation.NSDate

extension Location {
    public struct HoursOfOperation: Codable, Hashable, Equatable {
        /// mon | tue | wed | thu | fri | sat | sun
        public let daysOfWeek: DaysOfWeek
        
        /// The Location is open all day
        public let allDay: Bool
        
        /// Time that the Location opens
        public let openingTime: Date
        
        /// Time that the Location closes
        public let closingTime: Date
    }
}
