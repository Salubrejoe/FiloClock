
import SwiftUI
import StereographicUI


struct ControlBox: View {
  @Environment(SPManager.self) var manager
  
  @State private var year   : Double = 2000
  @State private var month  : Double = 1
  @State private var day    : Double = 1
  @State private var hour   : Double = 12
  @State private var minute : Double = 0
  
  var date: Date {
    let components = DateComponents(
      year: Int(year),
      month: Int(month),
      day: Int(day),
      hour: Int(hour),
      minute: Int(minute)
    )
    return Calendar.current.date(from: components)!
  }
  
  @State private var isMinimised: Bool = true
  @Namespace var namespace
  
  var body: some View {
    VStack {
      
      if !isMinimised {
        Group {
          latitudeGreenSlider()
          dateSliders()
        }
        .padding(.horizontal, 32)
      }
      
      Image(systemName: isMinimised ? "slider.horizontal.3" : "xmark")
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.ultraThinMaterial)
        )
        .onTapGesture {
          isMinimised.toggle()
        }
    }
    .padding(.bottom)
    .shadow(radius: 2)
    .onChange(of: date, updateManager)
  }
  
  @ViewBuilder
  private func smallView() -> some View {
    RoundedRectangle(cornerRadius: 20, style: .continuous)
      .fill(.ultraThinMaterial)
      .frame(width: 55, height: 55)
  }
}


// MARK: - Components
extension ControlBox {
  
  @ViewBuilder
  private func scaleFactorBlackSlider() -> some View {
    @Bindable var manager = manager
    sliderView(
      icon: "arrow.up.backward.and.arrow.down.forward.circle",
      value: $manager.scale,
      range: 10...500,
      format: "%.1f"
    )
  }
  
  @ViewBuilder
  private func latitudeGreenSlider() -> some View {
    @Bindable var manager = manager
    sliderView(
      icon: "globe",
      value: $manager.location.latitude.degrees,
      range: 0...90,
      format: "%.0fº",
      tint: .green
    )
  }
  
  @ViewBuilder
  private func dateSliders() -> some View {
    VStack(spacing: 0) {
      sliderView(
        icon: "clock",
        value: $minute,
        range: 0...60,
        format: "%.0f m",
        tint: .yellow
      )
      sliderView(
        icon: "clock",
        value: $hour,
        range: 0...24,
        format: "%.0f h",
        tint: .yellow
      )
      sliderView(
        icon: "calendar",
        value: $day,
        range: 0...31,
        format: "d %.0f",
        tint: .red
      )
      sliderView(
        icon: "calendar",
        value: $month,
        range: 0...12,
        format: "m %.0f",
        tint: .red
      )
//      sliderView(
//        icon: "calendar",
//        value: $year,
//        range: 1989...2025,
//        format: "%.0f",
//        tint: .red
//      )
    }
  }
  
  @ViewBuilder
  private func sliderView(icon: String, value: Binding<Double>, range: ClosedRange<Double>, format: String, tint: Color = .primary) -> some View {
    Section {
      HStack {
        Image(systemName: icon)
        Slider(value: value, in: range, step: 1)
          .tint(tint)
          .scaleEffect(0.9)
        Text(String(format: format, value.wrappedValue))
          .font(.footnote)
          .foregroundStyle(.secondary)
      }
      .padding(.vertical, 8)
      
    }
  }
  
  private func updateManager(_ oldValue: Date, _ newValue: Date) {
    manager.date = newValue
  }
}



// MARK: - Preview
#Preview {
  ControlBox()
    .environment(SPManager.preview)
}
