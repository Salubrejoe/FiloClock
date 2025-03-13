
import SwiftUI


struct JSONList: View {
  let db = StarDatabase.shared
  
  var allZodiacSigns: [EPHStar] {
    StarDatabase.shared.workableStars
      .filter { $0.constellation == .Tau }
      .sorted { $0.constellation.rawValue < $1.constellation.rawValue }
  }
  
  var body: some View {
    NavigationStack {
      List(allZodiacSigns) { star in
        VStack {
          HStack {
            Text(star.name)
            Spacer()
            Text(star.constellation.fullName)
              .foregroundStyle(.secondary)
          }

          HStack {
            HStack {
              VStack {
                Text("RA: \(Int(star.rightAscension.degrees).description)")
                Text("DE: \(Int(star.declination.degrees).description)")
              }
              Spacer()
              VStack {
                Text("Mag: \(Int(star.magnitude).description)")
                Text("Class: \(star.spectralClass.rawValue)")
              }
            }
            .font(.caption)
            .foregroundStyle(.secondary)
          }
        }
      }
      .navigationTitle("Antonè!")
    }
  }
}
