
import SwiftUI
import StereographicUI

struct Sun: View {
  @Environment(SPManager.self) var manager
  
  var body: some View {
    ZStack {
      Circle()
        .fill(.yellow)
        .blur(radius: 2)
      
      Circle()
        .fill(.white)
    }
    .frame(
      width: manager.scale/5,
      height: manager.scale/5
    )
    .offset(y: solarCalculations.sunOffset)
    .rotationEffect(solarCalculations.sunPosition)
  }
  
  var solarCalculations: SPSolarCalculator {
    .init(date: manager.date, scale: manager.scale)
  }
}



// MARK: - Preview
#Preview {
  Sun()
    .environment(SPManager.preview)
}
