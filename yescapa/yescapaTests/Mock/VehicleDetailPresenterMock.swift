//
//  VehicleDetailPresenterMock.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation

@testable import yescapa

class VehicleDetailPresenterMock: VehicleDetailPresenterProtocol {
    var didLoadCallStatus = false
    
    func didLoad() {
        didLoadCallStatus = true
    }
}
