//
//  UtilsTests.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import XCTest
@testable import App

final class UtilsTests: XCTestCase {
    
    func testisIPAddress() {
        let validIPv4 = "192.168.0.1"
        let invalidIPv4 = "192.168.0"
        
        XCTAssertTrue(validIPv4.isIPAddress())
        XCTAssertFalse(invalidIPv4.isIPAddress())
    }
    
    func testIsIPv4WithVariations() {
        XCTAssertTrue("172.16.254.1".isIPAddress())
        XCTAssertTrue("10.0.0.255".isIPAddress())
        XCTAssertTrue("192.168.1.1".isIPAddress())
        XCTAssertFalse("256.256.256.256".isIPAddress())
        XCTAssertFalse("google.com".isIPAddress())
        XCTAssertFalse("172.16.254".isIPAddress())
        XCTAssertFalse("172.16.254.1.1".isIPAddress())
    }
    
    func testToBool() {
        let successString = "success"
        let failureString = "failure"
        
        XCTAssertTrue(successString.toBool())
        XCTAssertFalse(failureString.toBool())
    }
    
    func testToBoolWithVariations() {
        XCTAssertTrue("success".toBool())
        XCTAssertTrue("Success".toBool())
        XCTAssertTrue("SUCCESS".toBool())
        XCTAssertFalse("fail".toBool())
        XCTAssertFalse("Fail".toBool())
        XCTAssertFalse("FAIL".toBool())
        XCTAssertFalse("abc".toBool())
    }
}
