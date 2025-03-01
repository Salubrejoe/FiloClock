
import SwiftUI


#Preview {
  WatchCrownWith24Hours(scale: .constant(100.0))
}

struct WatchCrownWith24Hours: View {
 
  @Environment(\.colorScheme) var colorScheme
  @Binding var scale: Double
  
  var body: some View {
    ZStack {
      hours()
      fifteenMinutes()
      innerShadow()
    }
    .font(.caption)
  }
}

extension WatchCrownWith24Hours {
  
  var offset: Double {
    scale * 1.8
  }
  
  var innerShadowFrameOffset: Double {
    scale * 0.33
  }
  
  private func innerShadow() -> some View {
    let color = colorScheme == .dark ? Color.black : Color.white
    return Circle()
      .fill(color.gradient.shadow(.inner(color: .primary, radius: scale*0.03, x: 0, y: 2)))
      .frame(
        width:  2*offset - innerShadowFrameOffset,
        height: 2*offset - innerShadowFrameOffset
      )
  }
  
  @ViewBuilder
  private func hours() -> some View {
    ForEach(0..<24) { hour in
      let angle = Angle.degrees(Double(hour) / 24 * 360) + Angle.degrees(180)
      VStack(spacing: 12) {
        Text("\(hour)")
        Text("")
      }
      .offset(y: -offset)
      .rotationEffect(angle)
    }
  }
  
  @ViewBuilder
  private func fifteenMinutes() -> some View {
    ForEach(0..<96) { fifteenMinutes in
      let angle = Angle.degrees(Double(fifteenMinutes) / 96 * 360)
      VStack(spacing: 0) {
        if fifteenMinutes % 4 != 0 {
          Text("•")
        } else {
          Text("|")
        }
      }
      .offset(y: -offset)
      .rotationEffect(angle)
    }
  }
}
