
import SwiftUI
import StereographicUI

@main
struct FiloClockApp: App {
  let appManager: SPManager = .init(date: .j2000, scale: 100.0, location: .home)
  
  var body: some Scene {
    WindowGroup {
      MainView()
        .fontDesign(.monospaced)
      
    }.environment(appManager)
  }
}


