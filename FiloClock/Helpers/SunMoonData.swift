
import WeatherKit
import CoreLocation


@Observable
class SunMoonData: NSObject, CLLocationManagerDelegate {
  private let weatherService  = WeatherService.shared
  private let locationManager = CLLocationManager()
  
  var location : CLLocation?
  var date     : Date
  var sun      : SunEvents?
  var moon     : MoonEvents?
  
  init(date: Date = .now) {
    self.date = date
    super.init()
    setupLocationManager()
  }
  
  private func setupLocationManager() {
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    location = locations.first
    Task {
      await fetchData()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Error fetching location: \(error)")
  }
  
  func fetchData() async {
    guard let location else {
      print("Location not available yet.")
      return
    }
    
    do {
      let forecast = try await weatherService
        .weather(for: location, including: .daily)
      
      guard let dayWeather = forecast.first(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) else {
        print("Forecast for given date not available.")
        return
      }
      
      sun = dayWeather.sun
      moon = dayWeather.moon
      
    } catch {
      print("Error fetching astro events: \(error)")
    }
  }
}
