
import SwiftUI

#Preview {
  FixedLatitudesBackground(scale: .constant(100.0))
}


struct FixedLatitudesBackground: View {
  @Binding var scale    : Double
  let equator           : Angle = .radians(0)
  let tropicOfCancer    : Angle = .radians(0.41)
  let tropicOfCapricorn : Angle = .radians(-0.41)
  
  var body: some View {
    
    ZStack {
      
      // EQUATOR
      LineOfLatitude(
        radius: equator.radians.calculateProjectionsRadius(scale: scale),
        offset: 0,
        color: .red,
        lineWidth: 4
      )
      
      // TROPIC OF CANCER
      LineOfLatitude(
        radius: tropicOfCancer.radians.calculateProjectionsRadius(scale: scale),
        offset: 0,
        color: .gray,
        lineWidth: 1
      )
      
      // TROPIC OF CAPRICORN
      LineOfLatitude(
        radius: tropicOfCapricorn.radians.calculateProjectionsRadius(scale: scale),
        offset: 0,
        color: .gray,
        lineWidth: 1
      )
      
      // Center Dot
      Circle()
        .frame(width: 4, height: 4)
    }
  }
}

