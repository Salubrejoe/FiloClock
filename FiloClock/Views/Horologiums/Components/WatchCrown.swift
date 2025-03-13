
import SwiftUI
import StereographicUI


struct WatchCrown: View {
  @Environment(SPManager.self) var manager
  
  var body: some View {
    ZStack {
      
      ForEach(0..<24) { index in
        VStack(spacing: 12) {
          Text("\(index)")
        }
        .font(hourMarkerFont)
        .offset(y: -dialOffset)
        .rotationEffect(angleForHourMarker(index))
      }
      
      ForEach(0..<96) { index in
        if index % 4 != 0 {
          Text("|")
            .font(fifteenMinuteMarkerFont)
            .offset(y: -dialOffset)
            .rotationEffect(angleForFiteenMinutesMarker(index))
        }
      }
    }
    .foregroundStyle(.secondary)
    .font(.caption)
  }
}


// MARK: - Helpers
extension WatchCrown {
  
  var hourMarkerFont: Font { .system(size: manager.scale / 10, weight: .bold) }
  var fifteenMinuteMarkerFont: Font { .system(size: manager.scale / 20, weight: .semibold) }
  
  var scale: Double { manager.scale }
  
  var dialOffset: Double { scale * 1.7 }
  
  
  func angleForHourMarker(_ index: Int) -> Angle {
    Angle.degrees(Double(index) / 24 * 360) + Angle.degrees(180)
  }
  
  func angleForFiteenMinutesMarker(_ index: Int) -> Angle {
    Angle.degrees(Double(index) / 96 * 360)
  }
}
