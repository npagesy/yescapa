//
//  VehicleDetailProtocols.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation

protocol VehicleDetailPresenterProtocol {
    func didLoad()
}

protocol VehicleDetailViewControllerProtocol: AnyObject {
    func configureView(model: Vehicle)
}
