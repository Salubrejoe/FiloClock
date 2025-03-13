//
//import SwiftUI
//
//@Observable
//public class SPManager {
//  public static let main: SPManager = .init(date: .j2000, scale: 77, location: .Brighton)
//  
//  public var dragOffset: Double = 0.0
//  
//  /// These values will come from user input
//  public var date     : Date
//  public var scale    : Double // Radius of the equator in pixels
//  public var location : FiLocation
//  
//  /// Initializes an `SPManager`
//  public init(
//    date     : Date,
//    scale    : Double,
//    location : FiLocation
//  ) {
//    self.date     = date
//    self.scale    = scale
//    self.location = location
//  }
//  
//}
//
//// MARK: - Solar and Sidereal Calculations
//extension SPManager {
//  func sunsetCalculator(horizonLatitude latitude: Angle) -> SunsetCalculator {
//    .init(latitude: .degrees(90) - latitude)
//  }
//  
//  // SUN
//  /// The object that calculates the sun Offset and Position
//  var solarCalculator: SolarCalculator {
//    .init(date: date, scale: scale)
//  }
//  
//  // ZODIAC
//  /// The object that calculates the zodiac Offset and Position
//  var siderealCalculator: SiderealCalculator {
//    .init(date: date)
//  }
//}
//
//
//// MARK: - PREVIEW
//extension SPManager {
//  static let preview: SPManager = .init(date: .twentyFirstDecember, scale: 77.0, location: .celestialEquator)
//  static let dec21Brighton: SPManager = .init(date: .twentyFirstDecember, scale: 77.0, location: .Brighton)
//}
//
//
//
//
//
//
//
//
//
//
//
