
import SwiftUI

#Preview {
  LatitudeDependentHorizons(latitude: .constant(.radians(0)), scale: .constant(100.0))
}


struct LatitudeDependentHorizons: View {
  @Binding var latitude: Angle
  @Binding var scale: Double
  
  init(
    latitude: Binding<Angle>,
    scale: Binding<Double>
  ) {
    self._latitude = latitude
    self._scale = scale
  }
  
  var body: some View {
    ZStack {
      
      // GOLDEN HOUR HORIZON
      LineOfLatitude(
        radius: goldenHourCalculator.radius,
        offset: goldenHourCalculator.offset,
        color: .yellow,
        lineWidth: 2
      )
      
      // CIVIL SUNSET HORIZON
      LineOfLatitude(
        radius: civilPlaneCalculator.radius,
        offset: civilPlaneCalculator.offset,
        color: .blue,
        lineWidth: 2
      )
      
      // NAVAL SUNSET HORIZON
      LineOfLatitude(
        radius: navalPlaneCalculator.radius,
        offset: navalPlaneCalculator.offset,
        color: .purple,
        lineWidth: 2
      )
      
      // ASTRONOMICAL SUNSET HORIZON
      LineOfLatitude(
        radius: astronomicalPlaneCalculator.radius,
        offset: astronomicalPlaneCalculator.offset,
        color: .indigo,
        lineWidth: 2
      )
      
      // HORIZON
      LineOfLatitude(
        radius: horizonCalculator.radius,
        offset: horizonCalculator.offset,
        color: .green,
        lineWidth: 2
      )
    }
    .frame(
      width:  3.25*scale,
      height: 3.25*scale
    )
    .clipShape(
      Circle()
    )
  }
}


/// Helpers
extension LatitudeDependentHorizons {
  
  var horizonCalculator: ProjectedSizeCalculator {
    .init(latitude: latitude, scale: scale)
  }
  
  var goldenHourCalculator: ProjectedSizeCalculator {
    .init(latitude: latitude, aberration: 0.1, scale: scale)
  }
  
  var civilPlaneCalculator: ProjectedSizeCalculator {
    .init(latitude: latitude, aberration: -0.1, scale: scale)
  }
  
  var navalPlaneCalculator: ProjectedSizeCalculator {
    .init(latitude: latitude, aberration: -0.2, scale: scale)
  }
  
  var astronomicalPlaneCalculator: ProjectedSizeCalculator {
    .init(latitude: latitude, aberration: -0.31, scale: scale)
  }
}

