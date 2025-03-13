
import SwiftUI
import StereographicUI

struct MainView: View {
  @Environment(SPManager.self) var manager
  
  var body: some View {
    
    NavigationStack {
      ZStack {
        
        FullScreenHorologium()
          .frame(maxHeight: .infinity, alignment: .top)
        
        ControlBox()
          .frame(maxHeight: .infinity, alignment: .bottom)
      }
      .containerRelativeFrame([.horizontal, .vertical])
      .navigationTitle("Filo'Clock")
    }
  }
}



// MARK: - Preview
#Preview {
  MainView()
    .environment(SPManager.preview)
}
