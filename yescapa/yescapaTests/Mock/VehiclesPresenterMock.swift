//
//  VehiclesPresenterMock.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation

@testable import yescapa

class VehiclesPresenterMock: VehiclesPresenterProtocol {
    var didLoadCallStatus = false
    var numberOfRowsCallStatus = false
    var numberOfRowsCount = 2
    var willShowCallStatus = false
    var didSelectCallStatus = false
    
    func didLoad() {
        didLoadCallStatus = true
    }
    
    func numberOfRows() -> Int {
        numberOfRowsCallStatus = true
        return numberOfRowsCount
    }
    
    func willShow(cell: VehicleTableViewCellProtocol, indexPath: IndexPath) {
        willShowCallStatus = true
    }
    
    func didSelect(indexPath: IndexPath) {
        didLoadCallStatus = true
    }
}
