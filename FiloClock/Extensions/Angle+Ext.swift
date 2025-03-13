
import SwiftUI


extension Angle {
  
  init(hours: Double, minutes: Double, seconds: Double) {
    let degrees = (hours + minutes / 60 + seconds / 3600) * 15
    self = .degrees(degrees)
  }
  
  init(degrees: Double, arcMinutes: Double, arcSeconds: Double) {
    let degrees = (degrees + arcMinutes / 60 + arcSeconds / 3600)
    self = .degrees(degrees)
  }
}
