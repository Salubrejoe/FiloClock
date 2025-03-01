import SwiftUI

#Preview {
  HourClockHand(
    date: .constant(.now),
    scale: .constant(100.0)
  )
}


struct HourClockHand: View {

  @Binding var date: Date
  @Binding var scale: Double
  
  var body: some View {
    
    Hand(angle: handAngle(), scale: scale)
     .rotationEffect(.radians(.pi))
  }
}

extension HourClockHand {
 
  private func handAngle() -> Angle {
    let hourValue = Calendar.current
      .component(.hour, from: date)
    let minuteValue = Calendar.current
      .component(.minute, from: date)
    let hourDouble = Double(hourValue)
    let minuteDouble = Double(minuteValue)
    let hourDegrees = hourDouble / 24.0 * 360.0
    let minuteDegrees = minuteDouble*((360/96)/15)
    return .degrees(hourDegrees+minuteDegrees)
  }
  
  private struct Hand: View {
    let angle: Angle
    let scale: Double
    
    var body: some View {
      Capsule()
        .fill(.orange)
        .shadow(
          radius: 2,
          x: 10 * cos(angle.radians),
          y: 10 * sin(angle.radians)
        )
        .frame(width: 6, height: scale * 1.6)
        .offset(y: -scale*0.8)
        .rotationEffect(angle)
    }
  }
}
