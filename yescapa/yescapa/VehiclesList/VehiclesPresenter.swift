//
//  VehiclesPresenter.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 24/02/2022.
//

import Foundation
import Network

class VehiclesPresenter {
    private weak var view: VehiclesViewControllerProtocol?
    private let manager: ServiceProviderHelperProtocol
    private let delegate: VehiclesPresenterDelegate?
    var model: Vehicles?
    
    init(view: VehiclesViewControllerProtocol, manager: ServiceProviderHelperProtocol, delegate: VehiclesPresenterDelegate? = nil) {
        self.view = view
        self.manager = manager
        self.delegate = delegate
    }
}

// MARK: Protocols
extension VehiclesPresenter: VehiclesPresenterProtocol {
    func didLoad() {
        manager.vehicles.getVehicles { [weak self] (result: Result<VehiclesBO?, Error>) in
            switch result {
            case .success(let vehiclesBO):
                guard
                    let self = self,
                    let vehiclesBO = vehiclesBO
                else {
                    return
                }
                self.model = Vehicles(vehicles: vehiclesBO)
                self.view?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        model?.list.count ?? 0
    }
    
    func willShow(cell: VehicleTableViewCellProtocol, indexPath: IndexPath) {
        guard let vehicle = model?.list[indexPath.row] else { return }
        cell.configure(with: vehicle)
    }
    
    func didSelect(indexPath: IndexPath) {
        guard let selectedVehicle = model?.list[indexPath.row] else { return }
        delegate?.showVehicle(selectedVehicle)
    }
}
