//
//  VehicleDetailPresenterTests.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import XCTest
import Network

@testable import yescapa

var vehicle = Vehicle(id: 1,
                      title: "title",
                      price: 10,
                      reviewAverage: 4.5,
                      reviewCount: 10,
                      location: "Toulouse",
                      ownerString: "Mme patata",
                      ownerPictureURL: "",
                      pictures: [
                        Picture(id: "2", url: "url")
                      ])

class VehicleDetailPresenterTests: XCTestCase {
    private typealias Package = (
        sut: VehicleDetailPresenter,
        view: VehicleDetailViewControllerMock,
        manager: ServiceProviderMock
    )
    
    private func createSUT() -> Package {
        let view = VehicleDetailViewControllerMock()
        let manager = ServiceProviderMock()
        let sut = VehicleDetailPresenter(view: view, manager: manager, vehicle: vehicle)
        return (sut, view, manager)
    }
}

extension VehicleDetailPresenterTests {
    func test_viewDidLoad() {
        // Given
        let package = createSUT()
        // When
        package.sut.didLoad()
        // Then
        XCTAssertTrue(package.view.configureViewCallStatus)
    }
}
