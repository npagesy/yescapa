//
//  VehiclesTableViewControllerTests.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import XCTest

@testable import yescapa

class VehiclesTableViewControllerTests: XCTestCase {
    private typealias Package = (
        sut: VehiclesTableViewController,
        presenter: VehiclesPresenterMock
    )
    
    private func createSUT() -> Package {
        let sut = VehiclesTableViewController()
        _ = sut.view
        let presenter = VehiclesPresenterMock()
        sut.presenter = presenter
        return (sut, presenter)
    }
}

extension VehiclesTableViewControllerTests {
    func test_viewDidLoad() {
        // Given
        let package = createSUT()
        // When
        package.sut.viewDidLoad()
        // Then
        XCTAssertTrue(package.presenter.didLoadCallStatus)
    }
    
    func test_numberOfRows() {
        // Given
        let package = createSUT()
        // When
        let numberOfRows = package.sut.tableView(package.sut.tableView, numberOfRowsInSection: 0)
        // Then
        XCTAssertEqual(numberOfRows, package.presenter.numberOfRowsCount)
    }
    
    func test_cellForRowAt() {
        // Given
        let package = createSUT()
        // When
        _ = package.sut.tableView(package.sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        // Then
        XCTAssertTrue(package.presenter.willShowCallStatus)
    }

    func test_didSelectRow() {
        // Given
        let package = createSUT()
        // When
        package.sut.tableView(package.sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        // Then
        XCTAssertTrue(package.presenter.didSelectCallStatus)
    }
}
