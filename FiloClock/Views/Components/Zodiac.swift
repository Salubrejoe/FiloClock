
import SwiftUI


#Preview {
  Zodiac(
    date: .constant(.now),
    scale: .constant(100.0)
  )
}

struct Zodiac: View {
  
  @Binding var date  : Date
  @Binding var scale : Double
  
  var body: some View {
    
    ZStack {
      Circle()
        .stroke(.primary.opacity(0.1), lineWidth: 22)
      ForEach(ZodiacSign.zodiac) { sign in
        Text(sign.symbol)
          .offset(y: 0.49*calculator.radius)
          .rotationEffect(.degrees(Double(sign.index) * 30))
      }
    }
      
//      .offset(y: calculator.offset)
      .frame(
        width: calculator.radius,
        height: calculator.radius
      )
//      .rotationEffect(timeOfSolarDay)
//      .offset(y: siderealOffset)
//      .rotationEffect(timeOfSiderealDay)
  }
  
  
  // MARK: - ZODIAC CALCULATION
  var lenghtOfSolarDay: Double { 86_400 }
  var lenghtOfSiderealDay: Double { 86_164 }
  
  var timeOfSolarDay: Angle {
    let startOfDay = Calendar.current.startOfDay(for: date)
    let secondsPassed = date.timeIntervalSince(startOfDay)
    return .radians((Double(secondsPassed) / lenghtOfSolarDay) * 2 * .pi)
  }
  
  var timeOfSiderealDay: Angle {
    let referenceDate = Date(timeIntervalSince1970: 0) // UNIX epoch (or use a better astronomical epoch)
    let daysSinceReference = date.timeIntervalSince(referenceDate) / lenghtOfSolarDay
    let siderealRotation = daysSinceReference * (lenghtOfSolarDay / lenghtOfSiderealDay) * 2 * .pi
    return .radians(siderealRotation)
  }
  
  var calculator: ProjectedSizeCalculator {
    .init(latitude: Angle.radians(0.41), scale: scale)
  }
  
  var capricornCalculator: ProjectedSizeCalculator {
    .init(latitude: Angle.radians(-0.41), scale: scale)
  }
  
  var equatorCalculator: ProjectedSizeCalculator {
    .init(latitude: Angle.radians(0), scale: scale)
  }
  
  var siderealOffset: Double {
    calculator.radius - capricornCalculator.radius
  }
}
