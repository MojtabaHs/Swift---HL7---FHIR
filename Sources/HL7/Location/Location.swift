/// Details and position information for a physical place where services are provided and resources and participants may be stored, found, contained, or accommodated.
/// - Source: https://hl7.org/fhir/location.html
public class Location: Codable {
    /// Unique code or number identifying the location to its users
    public let identifiers: [Identifier]
    
    /// active | suspended | inactive
    public let status: Status
    
    /// The operational status of the location (typically only for a bed/room)
    public let operationalStatus: OperationalStatus
    
    /// Name of the location as used by humans
    public let name: String
    
    /// A list of alternate names that the location is known as, or was known as, in the past
    public let aliases: [String]
    
    /// Additional details about the location that could be displayed as further information to identify the location beyond its name
    public let description: String
    
    /// instance | kind
    public let mode: Mode
    
    /// Type of function performed
    public let types: [ServiceDeliveryLocationRoleType]
    
    /// Contact details of the location
    public let telecoms: [ContactPoint]
    
    /// Physical location
    public let address: Address
    
    /// Physical form of the location
    public let physicalType: `Type`
    
    /// The absolute geographic location
    public let position: Position
    
    /// Organization responsible for provisioning and upkeep
    public let managingOrganization: Organization
    
    /// Another Location this one is physically a part of
    public let partOf: Location?
    
    /// What days/times during a week is this location usually open
    public let hoursOfOperation: HoursOfOperation
    
    /// Description of availability exceptions
    public let availabilityExceptions: String
}
