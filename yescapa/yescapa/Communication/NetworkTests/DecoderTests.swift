//
//  DecoderTests.swift
//  NetworkTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import XCTest

@testable import Network

class DecoderTests: XCTestCase {
    
    func test_decodingValidData() throws {
        let validJson = """
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
        
        let data = try XCTUnwrap(validJson.data(using: .utf8))
        let vehicles = try Decoder<VehiclesBO>().decode(from: data)
        XCTAssertFalse(vehicles.results.isEmpty)
    }
    
    func test_decodingWrongData() throws {
        let wrongJson = """
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
        let data = try XCTUnwrap(wrongJson.data(using: .utf8))
        XCTAssertThrowsError(try Decoder<VehiclesBO>().decode(from: data)) { error in
            XCTAssertTrue(error is RequestError)
        }
    }
}
