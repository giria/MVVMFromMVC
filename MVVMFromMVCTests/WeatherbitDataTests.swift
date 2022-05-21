

import XCTest
@testable import Grados

class WeatherbitDataTests: XCTestCase {
  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd-yyyy"
    return formatter
  }()
  
  var exampleJSONData: Data!
  var weather: WeatherbitData!

  override func setUp() {
    let bundle = Bundle(for: type(of: self))
    let url = bundle.url(forResource: "WeatherbitExample", withExtension: "json")!
    exampleJSONData = try! Data(contentsOf: url)
  
    let decoder = JSONDecoder()
    weather = try! decoder.decode(WeatherbitData.self, from: exampleJSONData)
  }
    
  func testDecodeTemp() throws {
    XCTAssertEqual(weather.currentTemp, 24.19)
  }
  
  func testDecodeIcon() throws {
    XCTAssertEqual(weather.iconName, "c03d")
  }
  
  func testDecodeDescription() throws {
    XCTAssertEqual(weather.description, "Broken clouds")
  }
  
  func testDecodeDate() throws {
    XCTAssertEqual(Self.dateFormatter.string(from: weather.date), "08-28-2017")
  }

}
