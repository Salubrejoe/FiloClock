
import Foundation


class StarDatabase {
  static let shared = StarDatabase()
  private(set) var stars: [StarData] = []
  
  var workableStars: [EPHStar] {
    stars.map { .init(from: $0) }
  }
  
  func stars(for constellations: [EPHConstellation]) -> [EPHStar] {
    var stars = [EPHStar]()
    for star in workableStars {
      for constellation in constellations {
        if star.constellation == constellation {
          stars.append(star)
        }
      }
    }
    return stars
  }
 
  private init() { loadStars() }
  
  private func loadStars() {
    guard let url = Bundle.main.url(forResource: "bsc5", withExtension: "json") else {
      print("JSON file not found")
      return
    }
    
    do {
      let data = try Data(contentsOf: url)
      let decodedStars = try JSONDecoder().decode([StarData].self, from: data)
      self.stars = decodedStars
    } catch {
      print("Error decoding JSON: \(error)")
    }
  }
  
  func findStar(named starName: String) -> StarData? {
    return stars.first { $0.name?.lowercased() == starName.lowercased() }
  }
}
