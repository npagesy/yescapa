//
//  NetworkRouterTests.swift
//  NetworkTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import XCTest
import Network

@testable import Network

class NetworkRouterTests: XCTestCase {

    func test_buildUrlRequest() throws {
        let router = VehicleRouter.getVehicles
        let request = try router.asURLRequest().url?.absoluteString
        
        XCTAssertEqual(router.urlString, "https://gitlab.com")
        XCTAssertEqual(router.method, "GET")
        XCTAssertEqual(router.path, "/yescapa-pub/jobs/-/raw/master/iOS/data.json")
        XCTAssertEqual(request, "https://gitlab.com/yescapa-pub/jobs/-/raw/master/iOS/data.json")
    }
}
