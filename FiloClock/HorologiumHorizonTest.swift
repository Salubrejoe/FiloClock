
import SwiftUI


#Preview {
  HorologiumHorizonTest()
}

struct HorologiumHorizonTest: View {
  
  @State var date     : Date   = Date.now
  @State var scale    : Double = 77.0
  @State var latitude : Angle  = Angle.degrees(40)
  
  var body: some View {
    
    NavigationStack {
      
      VStack {
        MainClock(
          date: $date,
          scale: $scale,
          latitude: $latitude
        )
        .frame(height: 400)
        
        ControlBox(
          date: $date,
          scale: $scale,
          latitude: $latitude
        )
      }
      .scenePadding()
      .navigationTitle("Filo'Clock")
    }
  }
}
