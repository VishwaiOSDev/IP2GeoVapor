@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    
    func testHelloWorld() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.GET, "hello", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
    
    func testIP2Geo() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
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
}

//GeoInfo(status: true, ip: "172.225.137.215", country: "India", countryCode: "IN", regionName: "Tamil Nadu", city: "Chennai", currency: "INR")
