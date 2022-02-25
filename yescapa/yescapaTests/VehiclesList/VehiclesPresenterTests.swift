//
//  VehiclesPresenterTests.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import XCTest

@testable import yescapa

class VehiclesPresenterTests: XCTestCase {
    private typealias Package = (
        sut: VehiclesPresenter,
        view: VehiclesTableViewControllerMock,
        manager: ServiceProviderMock
    )
    
    private func createSUT() -> Package {
        let view = VehiclesTableViewControllerMock()
        let manager = ServiceProviderMock()
        let sut = VehiclesPresenter(view: view, manager: manager, delegate: nil)
        return (sut, view, manager)
    }
}

extension VehiclesPresenterTests {
    func test_didLoad() {
        // Given
        let package = createSUT()
        // When
        package.sut.didLoad()
        // Then
        XCTAssertTrue(package.view.reloadDataCallStatus)
    }
    
    func test_numberOfRows() {
        // Given
        let package = createSUT()
        package.sut.didLoad()
        // When
        let numberOfRows = package.sut.numberOfRows()
        // Then
        XCTAssertEqual(numberOfRows, package.sut.model?.list.count)
    }
    
    func test_willShow() {
        // Given
        let package = createSUT()
        package.sut.didLoad()
        let cell = VehicleTableViewCell()
        // When
        package.sut.willShow(cell: cell, indexPath: IndexPath(row: 0, section: 0))
        // Then
        XCTAssertNotNil(cell.vehicleMark.text)
        XCTAssertNotNil(cell.vehiclePrice.text)
        XCTAssertNotNil(cell.vehicleLocation.text)
        XCTAssertNotEqual(cell.vehicleRating.rating, 0)
        XCTAssertNotEqual(cell.vehicleRating.count, 0)
    }
}
