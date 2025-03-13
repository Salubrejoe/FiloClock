//
//import SwiftUI
//
//
//public struct SunsetCalculator {
//  public let latitude: Angle
//  
//  public var horizon: SouthPoleStereographicProjection {
//    .init(geodesicLatitude: latitude)
//  }
//  
//  public var goldenHour: SouthPoleStereographicProjection {
//    .init(
//      geodesicLatitude: latitude,
//      parallelDeviation: .radians(0.1)
//    )
//  }
//  
//  public var civil: SouthPoleStereographicProjection {
//    .init(
//      geodesicLatitude: latitude,
//      parallelDeviation: .radians(-0.1)
//    )
//  }
//  
//  public var naval: SouthPoleStereographicProjection {
//    .init(
//      geodesicLatitude: latitude,
//      parallelDeviation: .radians(-0.2)
//    )
//  }
//  
//  public var astronomical: SouthPoleStereographicProjection {
//    .init(
//      geodesicLatitude: latitude,
//      parallelDeviation: .radians(-0.31)
//    )
//  }
//}
