
import SwiftUI
import StereographicUI

struct FullScreenHorologium: View {
  @Environment(\.dismiss) var dismiss
  @Environment(SPManager.self) var manager
  
  @State private var currentAmount = 1.0
  @State private var finalAmount = 1.0
  @State private var offset = CGSize.zero
  @State private var isDragging = false
  
  var body: some View {
    ZStack {
      
      Horologium()
        .containerRelativeFrame([.horizontal])
        .containerRelativeFrame(
          .vertical,
          count: 3,
          span: 2,
          spacing: 0,
          alignment: .center
        )
        .offset(offset)
        .gesture(DragGesture()
          .onChanged { value in offset = value.translation })
    }
    .onChange(of: currentAmount) { oldValue, newValue in
      let finalAmount = finalAmount
      let newScale = finalAmount + currentAmount
      manager.scale = newScale * 100
    }
    .onChange(of: finalAmount) { oldValue, newValue in
      manager.scale = newValue * 100
    }
    .gesture(
      MagnifyGesture()
        .onChanged { value in
          currentAmount = value.magnification - 1
        }
        .onEnded { value in
          finalAmount += currentAmount
          currentAmount = 0
        }
    )
  }
}

struct Horologium: View {
  @Environment(\.colorScheme) var colorScheme
  var allZodiacSigns: [EPHStar] {
    StarDatabase.shared.workableStars.filter { $0.constellation.isZodiacSign
    }
  }
  
  let exclude: [Layer]
  
  init(exclude: [Layer] = []) {
    self.exclude = exclude
  }
  
  var body: some View {
    ZStack {
      backgroundColor
      
      if !exclude.contains(.gridProjection) {
        GridProjection()
          .opacity(0.5)
      }
      
      if !exclude.contains(.celestialEquator) {
        EquatorAndTropicsProjection()
      }
      
      if !exclude.contains(.horizons) {
        SunsetHorizons()
      }
      
      if !exclude.contains(.watchCrown) {
        WatchCrown()
      }
      
      if !exclude.contains(.zodiacStars) {
        ForEach(allZodiacSigns) { star in
          EPHStarProjection(name: star)
        }
      }
      
      if !exclude.contains(.sun) {
        Sun()
      }
    }
  }
  
  var backgroundColor: Color {
    colorScheme == .light ? Color(uiColor: .systemBackground) : Color(uiColor: .secondarySystemBackground)
  }
  
  enum Layer {
    case gridProjection
    case celestialEquator
    case horizons
    case watchCrown
    case zodiacStars
    case zodiacBand
    case sun
  }
}

#Preview {
  Horologium()
    .environment(SPManager.preview)
}
