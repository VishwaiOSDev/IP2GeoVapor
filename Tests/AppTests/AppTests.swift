@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    
    var app: Application!
    
    override func setUp() {
        super.setUp()
        app = Application(.testing)
        try! configure(app)
    }
    
    override func tearDown() {
        app.shutdown()
        super.tearDown()
    }
    
    func testIP2GeoForIndiaIPAddress() throws {
        try app.test(.GET, "json/172.225.137.215", afterResponse: { response in
            let receivedGeoInfo = try response.content.decode(GeoInfo.self)
            XCTAssertEqual(receivedGeoInfo.status, true)
            XCTAssertEqual(receivedGeoInfo.ip, "172.225.137.215")
            XCTAssertEqual(receivedGeoInfo.country, "India")
            XCTAssertEqual(receivedGeoInfo.countryCode, "IN")
            XCTAssertEqual(receivedGeoInfo.regionName, "Tamil Nadu")
            XCTAssertEqual(receivedGeoInfo.city, "Chennai")
            XCTAssertEqual(receivedGeoInfo.currency, "INR")
        })
    }
    
    func testIP2GeoForCanadaIPAddress() throws {
        try app.test(.GET, "json/24.48.0.1 ", afterResponse: { response in
            let receivedGeoInfo = try response.content.decode(GeoInfo.self)
            XCTAssertEqual(receivedGeoInfo.status, true)
            XCTAssertEqual(receivedGeoInfo.ip, "24.48.0.1")
            XCTAssertEqual(receivedGeoInfo.country, "Canada")
            XCTAssertEqual(receivedGeoInfo.countryCode, "CA")
            XCTAssertEqual(receivedGeoInfo.regionName, "Quebec")
            XCTAssertEqual(receivedGeoInfo.city, "Montreal")
            XCTAssertEqual(receivedGeoInfo.currency, "CAD")
        })
    }
    
    func testIP2GeoForInvalidIP() throws {
        try app.test(.GET, "json/24.48.0 ", afterResponse: { response in
            XCTAssertEqual(response.status, .badRequest)
        })
    }
}
