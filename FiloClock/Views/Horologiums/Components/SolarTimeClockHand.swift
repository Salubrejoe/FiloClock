//
//import SwiftUI
//
//
//struct SolarTimeClockHand: View {
//  @Environment(SPManager.self) var manager
//  
//  var body: some View {
//    Capsule()
//      .fill(.orange)
//      .opacity(0.5)
//      .frame(
//        width: 2,
//        height: handScale
//      )
//      .offset(y: handOffset)
//      .rotationEffect(handAngle)
//  }
//}
//
//
//// MARK: - Helpers
//extension SolarTimeClockHand {
//  
//  var date: Date { manager.date }
//  
//  var scale: Double { manager.scale }
//  
//  var handScale: Double { scale * 1.8 }
//  
//  var handOffset: Double { -handScale * 0.5 }
//  
//  var handAngle: Angle {
//    let hourValue = Calendar.current
//      .component(.hour, from: date)
//    let minuteValue = Calendar.current
//      .component(.minute, from: date)
//    let hourDouble = Double(hourValue)
//    let minuteDouble = Double(minuteValue)
//    let hourDegrees = hourDouble / 24.0 * 360.0
//    let minuteDegrees = minuteDouble*((360/96)/15)
//    return .degrees(hourDegrees+minuteDegrees + 180)
//  }
//}
//
//
//
//// MARK: - Preview
//#Preview {
//  SolarTimeClockHand()
//    .environment(SPManager.preview)
//}
