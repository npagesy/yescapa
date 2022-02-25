//
//  VehicleDetailViewControllerMock.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation

@testable import yescapa

class VehicleDetailViewControllerMock: VehicleDetailViewControllerProtocol {
    var configureViewCallStatus = false
    
    func configureView(model: Vehicle) {
        configureViewCallStatus = true
    }
}
