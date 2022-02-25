//
//  VehicleDetailPresenter.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import Network

class VehicleDetailPresenter {
    private weak var view: VehicleDetailViewControllerProtocol?
    private let manager: ServiceProviderHelperProtocol
    private let vehicle: Vehicle
    
    init(view: VehicleDetailViewControllerProtocol, manager: ServiceProviderHelperProtocol, vehicle: Vehicle) {
        self.view = view
        self.manager = manager
        self.vehicle = vehicle
    }
}

extension VehicleDetailPresenter: VehicleDetailPresenterProtocol {
    func didLoad() {
        view?.configureView(model: vehicle)
    }
}
