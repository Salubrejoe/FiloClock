
import SwiftUI
import StereographicUI


struct EPHStarProjection: View {
  @Environment(SPManager.self) var manager
  
  let star: EPHStar
  
  init(name star: EPHStar) {
    self.star = star
  }
  
  var body: some View {
    
    Circle()
      .fill(star.spectralClass.color)
      .frame(
        width : star.magnitude * projection.scale/700,
        height: star.magnitude * projection.scale/700
      )
      .shadow(radius: projection.scale/25)
      .offset(y: projection.radius)
      .rotationEffect(projection.longitude - .degrees(90))
  }
  
  var projection: SProjection {
    .init(
      geodesicLatitude: .zero,
      rightAscension: star.rightAscension,
      declination: star.declination,
      scale: manager.scale
    )
  }
}

