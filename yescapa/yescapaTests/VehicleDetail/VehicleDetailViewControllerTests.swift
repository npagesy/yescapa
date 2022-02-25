//
//  VehicleDetailViewControllerTests.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import XCTest

@testable import yescapa

class VehicleDetailViewControllerTests: XCTestCase {
    private typealias Package = (
        sut: VehicleDetailViewController,
        presenter: VehicleDetailPresenterMock
    )
    
    private func createSUT() -> Package {
        let sut = VehicleDetailViewController()
        _ = sut.view
        let presenter = VehicleDetailPresenterMock()
        sut.presenter = presenter
        return (sut, presenter)
    }
}

extension VehicleDetailViewControllerTests {
    func test_viewDidLoad() {
        // Given
        let package = createSUT()
        // When
        package.sut.viewDidLoad()
        // Then
        XCTAssertTrue(package.presenter.didLoadCallStatus)
    }
    
    func test_configureView() {
        // Given
        let package = createSUT()
        // When
        package.sut.configureView(model: vehicle)
        // Then
        XCTAssertEqual(package.sut.vehicleMark.text, vehicle.title)
        XCTAssertEqual(package.sut.vehiclePrice.text, vehicle.getFormattedStartingPrice())
        XCTAssertEqual(package.sut.vehicleLocation.text, vehicle.location)
        XCTAssertEqual(package.sut.vehicleRating.rating, vehicle.roundedReview())
        XCTAssertEqual(package.sut.vehicleRating.count, vehicle.reviewCount)
        XCTAssertEqual(package.sut.ownerLabel.text, vehicle.ownerString)
    }
}
