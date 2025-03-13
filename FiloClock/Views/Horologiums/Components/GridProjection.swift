
import SwiftUI
import StereographicUI


struct GridProjection: View {
  @Environment(SPManager.self) var manager

  var body: some View {
    ZStack {
      ForEach(allProjections) { projector in
        SPLatitudeLine(
          projection: projector,
          color: .primary.opacity(0.2),
          lineWidth: 0.5
        )
      }
    }
  }
}


// MARK: - Projections
extension GridProjection  {
  
  var allProjections: [SProjection] { latitudeProjections + horizonProjections }
  
  var latitudeProjections: [SProjection] {
    range.map {
      .init(
        geodesicLatitude: .zero,
        declination: .radians($0),
        scale: manager.scale
      )
    }
  }
  
  var horizonProjections: [SProjection] {
    let displacement = Angle.degrees(90) - manager.location.latitude
    return range.map {
      .init(
        geodesicLatitude: displacement,
        declination: .radians($0),
        scale: manager.scale
      )
    }
  }
  
  private var range: [Double] {
    stride(
      from: -.pi * 0.5,
      to: .pi * 0.5,
      by: .pi / 12
    ).map { $0 }
  }
}



// MARK: - Preview
#Preview {
  GridProjection()
    .environment(SPManager.preview)
}
