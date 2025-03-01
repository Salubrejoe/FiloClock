
import SwiftUI


struct LineOfLatitude: View {
  
  let radius    : Double
  let offset    : Double
  let color     : Color
  let lineWidth : Double
  let sunAngle  : Angle
  
  init(
    radius    : Double,
    offset    : Double,
    color     : Color,
    lineWidth : Double,
    sunAngle  : Angle = .zero
  ) {
    self.radius    = radius
    self.offset    = offset
    self.color     = color
    self.lineWidth = lineWidth
    self.sunAngle  = sunAngle
  }
  
  var body: some View {
    Circle()
      .stroke(
        color,
        lineWidth: lineWidth
      )
      .offset(y: offset)
      .frame(
        width: 2 * radius,
        height: 2 * radius
      )
      .rotationEffect(sunAngle)
  }
}

