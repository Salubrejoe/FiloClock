
import SwiftUI


#Preview {
  ControlBox(
    date: .constant(.now),
    scale: .constant(100.0),
    latitude: .constant(.degrees(50))
  )
}

struct ControlBox: View {

  @Binding var date     : Date
  @Binding var scale    : Double
  @Binding var latitude : Angle
  
  var body: some View {
    
    Group {
      
      scaleFactorBlackSlider()
      
      latitudeGreenSlider()
      
      datePicker()
    }
  }
}


extension ControlBox {
  
  @ViewBuilder
  private func scaleFactorBlackSlider() -> some View {
    HStack {
      Image(systemName: "arrow.up.backward.and.arrow.down.forward.circle")
      Slider(value: $scale, in: 10...150)
        .tint(.primary)
      Text("\(scale, specifier: "%.1f")")
        .font(.footnote)
        .foregroundStyle(.secondary)
    }
    .padding(.vertical, 16)
  }
  
  @ViewBuilder
  private func latitudeGreenSlider() -> some View {
    HStack {
      Image(systemName: "globe")
      Slider(value: $latitude.degrees, in: 0...90)
        .tint(.green)
      Text("\(latitude.degrees, specifier: "%.0f")º")
        .font(.footnote)
        .foregroundStyle(.secondary)
    }
  }
  
  @ViewBuilder
  private func datePicker() -> some View {
    DatePicker(selection: $date, displayedComponents: [.date, .hourAndMinute]) {
      Image(systemName: "calendar")
    }
    .padding(.vertical, 16)
  }
}
