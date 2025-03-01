
import SwiftUI


struct ProjectedSizeCalculator {
  let latitude: Angle
  let scale: Double
  let aberration: Double?
  
  init(latitude: Angle, aberration: Double? = nil, scale: Double) {
    self.latitude = latitude
    self.scale = scale
    self.aberration = aberration
  }
  
  var center: Double {
    x1-x2
  }
  
  var 𝜗: Double {
    latitude.radians
  }
  
  var x1: Double {
    var 𝜗1 = (Double.pi/2) - 𝜗
    if let aberration {
      𝜗1 += aberration
    }
    return 𝜗1.calculateProjectionsRadius(scale: scale)
  }
  
  var x2: Double {
    let minusPiHalf = -Double.pi/2
    var 𝜗2 = minusPiHalf - 𝜗
    if let aberration {
      𝜗2 -= aberration
    }
    return 𝜗2.calculateProjectionsRadius(scale: scale)
  }
  
  var radius: Double {
    let result = (x1 - x2) * 0.5
    guard result >= 0 else { return 9999 }
    return result
  }
  
  var offset: Double {
    (abs(x1) + x2) * 0.5
  }
}

extension Double {
  func calculateProjectionsRadius(scale: Double = 1) -> Double {
    guard sin(self) != 1 else { return 9999 }
    return scale * (cos(self) / (1 - sin(self)))
  }
}
