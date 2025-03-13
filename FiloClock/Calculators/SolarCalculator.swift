//import SwiftUI
//
//public struct SolarCalculator {
//  public static let preview = SolarCalculator(date: .now, scale: 100.0)
//  
//  /// Variables we need to initiate a Solar Calculator
//  /// These values will come from the App Manager
//  public let date  : Date
//  public let scale : Double // Radius of the equator in pixels
//  
//  /// Helpers
//  public let calendar  : Calendar = .current
//  public let earthTilt : Angle    = .degrees(23.444)
//  
//  /// This variable calculates somewhat mysteriously the right offset for the Sun.
//  public var sunOffset: Double {
//    scale * cos(sunDeclination.radians) / (1 - sin(sunDeclination.radians))
//  }
//  
//  /// This variable is calculated following: https://solarsena.com/solar-declination-angle-calculator/
//  public var sunDeclination: Angle {
//    let r = 360.0 / numberOfDaysInCurrentYear /// Degrees per day based on the year's length
//    let a = r * (dayOfTheYear + 10.0) /// Adjusted angle for Earth's orbit
//    let b = (r * (dayOfTheYear - 2.0)).degreesToRadians /// ?? Unknown factor
//    let c = (360 / .pi) * (0.0167) /// Orbital eccentricity correction factor
//    
//    let t = -earthTilt.radians /// Earth's axial tilt in radians
//    
//    let argument = (a + c * sin(b)).degreesToRadians /// Computes the argument for cosine function
//    
//    /// Declination of the Sun in radians
//    let declination = asin(sin(t) * cos(argument))
//    
//    return Angle.radians(declination) /// Returns the declination as an angle
//  }
//  
//  /// The value oscillates between 0 and 360 in a day
//  public var sunPosition: Angle {
//    let hourValue   = Double(calendar.component(.hour, from: date))
//    let minuteValue = Double(calendar.component(.minute, from: date))
//    
//    let hourDegrees   = hourValue * 360.0 / 24.0
//    let minuteDegrees = minuteValue * ((360/96)/15)
//    
//    return Angle.degrees(hourDegrees + minuteDegrees)
//  }
//}
//
//// MARK: - Helpers
//extension SolarCalculator {
//  private var numberOfDaysInCurrentYear: Double {
//    let december31st = DateComponents(year: Calendar.current.component(.year, from: date), month: 12, day: 31)
//    let dec31Date = Calendar.current.date(from: december31st)!
//    return Double(Calendar.current.ordinality(of: .day, in: .year, for: dec31Date) ?? 1)
//  }
//  
//  private var dayOfTheYear: Double {
//    let calendar = Calendar.current
//    let ordinality = calendar.ordinality(of: .day, in: .year, for: date) ?? 1
//    return Double(ordinality)
//  }
//}
