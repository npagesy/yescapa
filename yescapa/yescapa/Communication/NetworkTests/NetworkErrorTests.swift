//
//  NetworkErrorTests.swift
//  NetworkTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import XCTest

@testable import Network

class NetworkErrorTests: XCTestCase {

    func test_initCorrectly() {
        let notFoundError = NetworkError(statusCode: 404)
        let forbiddenError = NetworkError(statusCode: 403)
        let notImplementedError = NetworkError(statusCode: 501)
        let redirectionError = NetworkError(statusCode: 310)
        
        XCTAssertEqual(notFoundError, .notFound)
        XCTAssertEqual(notFoundError.errorDescription, NSLocalizedString("not_found", comment: ""))
        
        XCTAssertEqual(forbiddenError, .technicalError)
        XCTAssertEqual(forbiddenError.errorDescription, NSLocalizedString("technical_error", comment: ""))
        
        XCTAssertEqual(notImplementedError, .technicalServerError)
        XCTAssertEqual(notImplementedError.errorDescription, NSLocalizedString("technical_server_error", comment: ""))
        
        XCTAssertEqual(redirectionError, .networkError)
        XCTAssertEqual(redirectionError.errorDescription, NSLocalizedString("network_error", comment: ""))
    }
}
