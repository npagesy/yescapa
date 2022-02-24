//
//  VehiclesServiceProviderTests.swift
//  NetworkTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 24/02/2022.
//

import XCTest

@testable import Network

class VehiclesServiceProviderTests: XCTestCase {
    var urlSession: URLSession!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }

    func test_getVehicles() throws {
        // Given
        let webServiceManager = URLSessionServiceProvider(urlSession: urlSession)
        let vehiclesSampleData = """
        {
            "results": [
                {
                    "id": 6275,
                    "title": "Chausson Flash 07 Clim cellule",
                    "starting_price": 75,
                    "currency_used": "EUR",
                    "review_average": 4.5,
                    "review_count": 9,
                    "vehicle_type": "CoachBuilt",
                    "vehicle_beds": 6,
                    "vehicle_seats": 5,
                    "vehicle_location_city": "Serpaize",
                    "vehicle_location_zipcode": "38200",
                    "vehicle_owner_first_name": "Alexandre",
                    "vehicle_owner_language": "FR",
                    "vehicle_owner_picture_url": "https://dtngh3spc2o8h.cloudfront.net/picture/44ba8fd2-aa28-49b1-8b4c-0c3dc1570986?w=100&h=100&fit=crop",
                    "url": "https://www.yescapa.fr/camping-cars/6275/",
                    "pictures": [
                        {
                            "id": "ff38c897-1faa-4c27-ab4d-3364cae6a541",
                            "url": "https://dtngh3spc2o8h.cloudfront.net/picture/ff38c897-1faa-4c27-ab4d-3364cae6a541?w=638&h=426"
                        }
                    ]
                }
            ]
        }
        """
        let mockData = try XCTUnwrap(vehiclesSampleData.data(using: .utf8))
        
        MockURLProtocol.requestHandler = { request in
            (HTTPURLResponse(), mockData)
        }
        
        let expectation = XCTestExpectation(description: "response")
        
        // When
        webServiceManager.vehicles.getVehicles { (result: Result<VehiclesBO?, Error>) in
            // Then
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertTrue(error is NetworkError)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
