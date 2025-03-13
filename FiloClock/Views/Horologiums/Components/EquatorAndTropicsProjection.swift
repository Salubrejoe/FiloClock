
import SwiftUI
import StereographicUI


struct EquatorAndTropicsProjection: View {
  @Environment(SPManager.self) var manager
  
  var body: some View {
    ZStack {
      
      SPLatitudeLine(
        projection: tCancerProjection,
        legend: "Tr. of Cancer",
        rotation: .degrees(-45)
      )
      
      SPLatitudeLine(
        projection: tCapricornProjection,
        legend: "Tr. of Capricorn",
        rotation: .degrees(-45)
      )
      
      SPLatitudeLine(
        projection: celestialEquator,
        color: .primary,
        lineWidth: 2,
        legend: "CE",
        rotation: .degrees(-45)
      )
    }
  }
}


// MARK: - Projections
extension EquatorAndTropicsProjection {
  
  var celestialEquator: SProjection {
    .init(
      geodesicLatitude: .zero,
      scale: manager.scale
    )
  }
  
  var tCancerProjection: SProjection {
    .init(
      geodesicLatitude: .zero,
      declination: .degrees(23.444),
      scale: manager.scale
    )
  }
  var tCapricornProjection: SProjection {
    .init(
      geodesicLatitude: .zero,
      declination: .degrees(-23.444),
      scale: manager.scale
    )
  }
}



// MARK: - Preview
#Preview {
  EquatorAndTropicsProjection()
    .environment(SPManager.preview)
}
