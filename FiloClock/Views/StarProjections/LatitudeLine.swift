//
//import SwiftUI
//
//
//public struct LatitudeLine: View {
//
//  public let projection  : SouthPoleStereographicProjection
//  public let color       : Color
//  public let lineWidth   : Double
//  public let legend      : String?
//  public let rotation    : Angle
//  public let scale       : Double
//  
//  public init(
//    projection  : SouthPoleStereographicProjection,
//    color      : Color   = .gray,
//    lineWidth  : Double  = 1.0,
//    legend     : String? = nil,
//    rotation   : Angle   = .zero,
//    scale      : Double
//  ) {
//    self.projection = projection
//    self.color      = color
//    self.lineWidth  = lineWidth
//    self.legend     = legend
//    self.rotation   = rotation
//    self.scale      = scale
//  }
//  
//  public var body: some View {
//    
//    Circumference(color: color, lineWidth: lineWidth, radius: projection.radius, offset: projection.offset)
//      .overlay(content: legendLabel)
//  }
//  
//  @ViewBuilder
//  private func legendLabel() -> some View {
//    if let legend {
//      Text(legend)
//        .font(
//          .system(
//            size: scale/30,
//            weight: .bold
//          )
//        )
//        .foregroundStyle(color)
//        .padding(scale/50)
//        .background(Capsule().fill(.ultraThinMaterial))
//        .offset(y: projection.offset - projection.radius)
//        .rotationEffect(rotation)
//    }
//  }
//}
//
