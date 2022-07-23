import Foundation.NSDate

/// Time range defined by start and end date/time
public struct Period: Codable, Hashable, Equatable {
    /// Starting time with inclusive boundary
    public let start: Date
    /// End time with inclusive boundary, if not ongoing
    public let end: Date?
}
