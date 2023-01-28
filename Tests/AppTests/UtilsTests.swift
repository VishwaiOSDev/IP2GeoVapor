//
//  UtilsTests.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import XCTest
@testable import App

final class UtilsTests: XCTestCase {
    
    func testIsIPv4() {
        let validIPv4 = "192.168.0.1"
        let invalidIPv4 = "192.168.0"
        
        XCTAssertTrue(validIPv4.isIPv4())
        XCTAssertFalse(invalidIPv4.isIPv4())
    }
    
    func testIsIPv4WithVariations() {
        XCTAssertTrue("172.16.254.1".isIPv4())
        XCTAssertTrue("10.0.0.255".isIPv4())
        XCTAssertTrue("192.168.1.1".isIPv4())
        XCTAssertFalse("256.256.256.256".isIPv4())
        XCTAssertFalse("google.com".isIPv4())
        XCTAssertFalse("172.16.254".isIPv4())
        XCTAssertFalse("172.16.254.1.1".isIPv4())
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
