//
//  VehicleTableViewCellTests.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import XCTest
import Network

@testable import yescapa

class VehicleTableViewCellTests: XCTestCase {
    
    func test_setupView() {
        // Given
        let cell = VehicleTableViewCell()
        // Then
        XCTAssertNotNil(cell.stackView.subviews)
    }
    
    func test_prepareForReuse() {
        // Given
        let cell = VehicleTableViewCell()
        // When
        cell.prepareForReuse()
        // Then
        XCTAssertNil(cell.vehicleImageView.image)
    }
    
    func test_configure() {
        // Given
        let model = Vehicle(id: 1,
                            title: "title",
                            price: 10,
                            reviewAverage: 4.5,
                            reviewCount: 100,
                            location: "Toulouse",
                            ownerString: "Mme patate",
                            ownerPictureURL: "",
                            pictures: [
                                Picture(id: "2", url: "url")
                            ])
        
        let cell = VehicleTableViewCell()
        // When
        cell.configure(with: model)
        // Then
        XCTAssertEqual(cell.vehicleMark.text, model.title)
        XCTAssertEqual(cell.vehiclePrice.text, model.getFormattedStartingPrice())
        XCTAssertEqual(cell.vehicleLocation.text, model.location)
        XCTAssertEqual(cell.vehicleRating.rating, Int(model.reviewAverage.rounded()))
        XCTAssertEqual(cell.vehicleRating.count, model.reviewCount)
    }
}
