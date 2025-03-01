
import SwiftUI


#Preview {
  MainClock(
    date: .constant(.now),
    scale: .constant(100.0),
    latitude: .constant(.degrees(50))
  )
}

struct MainClock: View {
  
  @Binding var date     : Date
  @Binding var scale    : Double
  @Binding var latitude : Angle
  
  var body: some View {
    
    ZStack {
      WatchCrownWith24Hours(scale: $scale)
        .overlay {
          
          Group {
            FixedLatitudesBackground(scale: $scale)
              .opacity(0.2)
            
            LatitudeDependentHorizons(latitude: $latitude, scale: $scale)
              .animation(.easeInOut, value: latitude)
              .opacity(0.5)
            
            Zodiac(date: $date, scale: $scale)
            HourClockHand(date: $date, scale: $scale)
          }
        }
    }
  }
}
