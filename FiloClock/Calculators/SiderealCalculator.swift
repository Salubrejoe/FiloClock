//import SwiftUI
//
//public struct SiderealCalculator {
//  
//  public let date: Date  // The date for which we want to calculate sidereal time
//  
//  /// Computes the sidereal angle based on time elapsed since the reference date (2000-01-01 12:00:00 UTC)
//  public var siderealAngle: Angle {
//    let twoPi = Double.pi * 2
//    let j2000 = date.timeIntervalSince(.j2000)  // Seconds since J2000
//    let siderealSecondsInADay = 86164.0905  // A sidereal day in seconds
//    
//    let radians = j2000 * twoPi / siderealSecondsInADay  // Convert to radians
//    
//    return .radians(radians)  // Return the computed angle
//  }
//  
//  /// Extracts year, month, and day from the date and calculates the 'z' correction factor
//  public var selectedDate: (year: Int, month: Int, day: Int, z: Int) {
//    let calendar = Calendar.current
//    let year = calendar.component(.year, from: date)
//    let month = calendar.component(.month, from: date)
//    let day = calendar.component(.day, from: date)
//    let z = Int((month - 14) / 12)  // Used in Julian date calculation
//    return (year, month, day, z)
//  }
//  
//  /// Julian Date Calculation Components
//  /// Julian Day Number (JDN) formula: JDN = A/4 + B/12 - C/4 + d - 32075
//  
//  public var A: Int {
//    1461 * selectedDate.year + 4800 + selectedDate.z  // Part of the Julian date calculation
//  }
//  
//  public var B: Int {
//    367 * (selectedDate.month - 2 - (12 * selectedDate.z))  // Adjusts for months and leap years
//  }
//  
//  public var C: Int {
//    3 * ((selectedDate.year + selectedDate.z + 4900) / 100)  // Accounts for century leap years
//  }
//  
//  public var JDN: Int {
//    A / 4 + B / 12 - C / 4 + selectedDate.day - 32075  // Final Julian Day Number
//  }
//  
//  /// Julian Date with time (JDT)
//  /// Formula: JT = JDN + (h-12)/24 + m/1440 + s/86400
//  
//  public var selectedTime: (hour: Int, min: Int, sec: Int) {
//    let calendar = Calendar.current
//    let hour = calendar.component(.hour, from: date)
//    let min = calendar.component(.minute, from: date)
//    let sec = calendar.component(.second, from: date)
//    return ((hour - 12) / 24, min / 1440, sec / 86400)  // Convert time components to fractions of a day
//  }
//  
//  public var JDT: Double {
//    Double(JDN + selectedTime.hour + selectedTime.min + selectedTime.sec)  // Full Julian Date with time
//  }
//  
//  public var midday1stJan2000: Double {
//    2451545.0  // Julian date at noon on January 1, 2000
//  }
//  
//  public var Dtt: Double {
//    JDT - midday1stJan2000  // Days since the reference epoch (1st Jan 2000)
//  }
//  
//  public var fractionOfCenturyPassed: Double {
//    Dtt / 36525.0  // Convert days to centuries since the epoch
//  }
//  
//  /// Computes the Greenwich Mean Sidereal Time (GMST) in degrees
//  public var GMST: Angle {
//    let degrees = 280.46061837
//    + 360.98564736629 * Dtt  // Primary term based on days passed
//    + 0.000387933 * pow(fractionOfCenturyPassed, 2)  // Small correction factor
//    - pow(fractionOfCenturyPassed, 3) / 38710000  // Even smaller correction factor
//    
//    return .degrees(degrees + siderealAngle.degrees)  // Returns the GMST angle
//  }
//}
