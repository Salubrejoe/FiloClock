
import SwiftUI
import StereographicUI


struct SunsetHorizons: View {
  @Environment(SPManager.self) var manager

  var body: some View {
    ZStack {
      
      // GOLDEN HOUR HORIZON
      SPLatitudeLine(
        projection: sunset.goldenHour,
        color: .yellow
      )
      
      // CIVIL SUNSET HORIZON
      SPLatitudeLine(
        projection: sunset.civil,
        color: .blue
      )
      
      // NAVAL SUNSET HORIZON
      SPLatitudeLine(
        projection: sunset.naval,
        color: .purple
      )
      
      // ASTRONOMICAL SUNSET HORIZON
      SPLatitudeLine(
        projection: sunset.astronomical,
        color: .indigo
      )
      
      // HORIZON
      SPLatitudeLine(
        projection: sunset.horizon,
        color: .green,
        lineWidth: 2,
        legend: "Horizon"
      )
    }
    .frame(
      width:  horizonsFrame,
      height: horizonsFrame
    )
    .clipShape(Circle())
  }
  
  var horizonsFrame: Double { 3.23 * manager.scale }
  
  var sunset: SPSunsetCalculator {
    .init(latitude: manager.location.latitude, scale: manager.scale)
  }
}



// MARK: - Preview
#Preview {
  SunsetHorizons()
    .environment(SPManager.preview)
}
