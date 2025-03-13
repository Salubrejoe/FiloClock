//
//import SwiftUI
//
//@Observable
//class SouthPoleStereographicProjection: Identifiable {
//  typealias Radians = Double
//  typealias Pixel   = Double
//  
//  let id = UUID()
//  
//  /// Latitude of the the geodesic as Angle from Equator
//  var geodesicLatitude: Angle
//  
//  var longitudeDisplacement: Angle?
//  var longitude: Angle {
//    longitudeDisplacement ?? .zero
//  }
//  
//  /// Equatorial radius in pixels
//  var scale: Pixel = AppManager.main.scale
//  
//  /// Angular deviation from the geodesic (optional, used for parallel projection)
//  var parallelDeviation: Angle?
//  var deviation: Angle { (parallelDeviation ?? .zero) }
//  
//  init(
//    geodesicLatitude      : Angle,
//    longitudeDisplacement : Angle? = nil,
//    parallelDeviation     : Angle? = nil
//  ) {
//    self.geodesicLatitude      = geodesicLatitude
//    self.parallelDeviation     = parallelDeviation
//    self.longitudeDisplacement = longitudeDisplacement
//  }
//  
//  /// Uppermost and lowermost horizon angles due to projection
//  var upperHorizonAngle: Radians { .pi * 0.5 - geodesicLatitude.radians + deviation.radians }
//  var lowerHorizonAngle: Radians { .pi * 0.5 + geodesicLatitude.radians + deviation.radians }
//  
//  /// Half-angle tangents for calculating distances
//  /// Small corrections (0.001) stabilize the tangent function
//  var tanHalfUpperAngle: Radians { upperHorizonAngle * 0.5 + 0.001 }
//  var tanHalfLowerAngle: Radians { lowerHorizonAngle * 0.5 - 0.001 }
//  
//  /// Distances from the projection center
//  var upperDistance: Pixel { scale * tan(tanHalfUpperAngle) }
//  var lowerDistance: Pixel { scale * tan(tanHalfLowerAngle) }
//  
//  
//  var radiusWithASign: Pixel { (upperDistance + lowerDistance) * 0.5 }
//  
//  /// Final projection radius
//  var radius: Pixel {
//    abs(radiusWithASign)
//  }
//  
//  /// Offset needed to correctly align the projection
//  var offset: Pixel {
//    radiusWithASign - upperDistance
//  }
//}
//
//
//// MARK: - Data
//extension SouthPoleStereographicProjection {
//  static var equatorProjector: SouthPoleStereographicProjection {
//    .init(geodesicLatitude: .zero)
//  }
//  
//  static var tropicOfCancerProjector: SouthPoleStereographicProjection {
//    .init(
//      geodesicLatitude: .zero,
//      parallelDeviation: FiLocation.tropicOfCancer.latitude
//    )
//  }
//  
//  
//  static var tropicOfCapricornProjector: SouthPoleStereographicProjection {
//    .init(
//      geodesicLatitude: .zero,
//      parallelDeviation: FiLocation.tropicOfCapricorn.latitude
//    )
//  }
//  
//  static func zodiacProjector(forSign sign: FiStar) -> SouthPoleStereographicProjection {
//    .init(
//      geodesicLatitude: .zero,
//      longitudeDisplacement: sign.j2000RightAscension,
//      parallelDeviation: sign.j2000Declination
//    )
//  }
//}
//
//
//
