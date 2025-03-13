
import SwiftUI


public class FiLocation: Identifiable {
  public let id        : UUID
  public var name      : String
  public var latitude  : Angle
  public var longitude : Angle
  
  public init(
    name      : String,
    latitude  : Angle,
    longitude : Angle
  ) {
    self.id        = UUID()
    self.name      = name
    self.latitude  = latitude
    self.longitude = longitude
  }
}


// MARK: - MOCK LOCATION
public extension FiLocation {
  static let Brighton: FiLocation = .init(
    name      : "Brighton",
    latitude  : .degrees(50.0),
    longitude : .degrees(0.0)
  )
  
  static let celestialEquator: FiLocation = .init(
    name      : "Celestial Equator",
    latitude  : .degrees(0.0),
    longitude : .degrees(0.0)
  )
  
  static let tropicOfCancer: FiLocation = .init(
    name      : "Tropic of Cancer",
    latitude  : .degrees(23.444),
    longitude : .degrees(0.0)
  )
  
  static let tropicOfCapricorn: FiLocation = .init(
    name      : "Tropic of Capricorn",
    latitude  : .degrees(-23.444),
    longitude : .degrees(0.0)
  )
}
