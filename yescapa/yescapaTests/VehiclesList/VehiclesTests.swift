//
//  VehiclesTests.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import Network
import XCTest

@testable import yescapa

var vehiclesBO =  """
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
                },
                {
                    "id": 27229,
                    "title": "Volkswagen Combi Bay Window Westfalia",
                    "starting_price": 90,
                    "currency_used": "EUR",
                    "review_average": 4.8,
                    "review_count": 6,
                    "vehicle_type": "Van",
                    "vehicle_beds": 4,
                    "vehicle_seats": 5,
                    "vehicle_location_city": "Audresselles",
                    "vehicle_location_zipcode": "62164",
                    "vehicle_owner_first_name": "Clément",
                    "vehicle_owner_language": "FR",
                    "vehicle_owner_picture_url": "https://dtngh3spc2o8h.cloudfront.net/picture/8eafe87d-9009-4350-a03f-dfba80182d5c?w=100&h=100&fit=crop",
                    "url": "https://www.yescapa.fr/camping-cars/27229/",
                    "pictures": [
                        {
                            "id": "08d9a500-5a67-4e2e-be29-b683413deb66",
                            "url": "https://dtngh3spc2o8h.cloudfront.net/picture/08d9a500-5a67-4e2e-be29-b683413deb66?w=638&h=426"
                        }
                    ]
                }
            ]
        }
        """

class VehiclesTests: XCTestCase {
    
    func test_initVehicles() throws {
        // Given
        let data = try XCTUnwrap(vehiclesBO.data(using: .utf8))
        let vehiclesBO = try JSONDecoder().decode(VehiclesBO.self, from: data)
        
        // When
        let vehicles = Vehicles(vehicles: vehiclesBO)
        
        // Then
        XCTAssertNotNil(vehicles.list)
        XCTAssertEqual(vehicles.list.first?.id, 6275)
    }
}
