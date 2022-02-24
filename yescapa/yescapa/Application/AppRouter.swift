//
//  AppRouter.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation
import Network
import UIKit

final class AppRouter {
    private weak var navigationController: UINavigationController?
    private var webServiceProviderManager: ServiceProviderProtocol

    init(navigationController: UINavigationController, webServiceProviderManager: ServiceProviderProtocol) {
        self.navigationController = navigationController
        self.webServiceProviderManager = webServiceProviderManager
    }
    
    func startApplication() {
//        let delegate = VehiclesListViewController(showVehicleDetail: showVehicleDetail)
//        let viewController = assembleVehiclesListViewController(delegate: delegate)
//        navigationController?.pushViewController(viewController, animated: true)
    }
    
//    private func showVehicleDetail(vehicle: Vehicle) {
//        let viewController = assembleVehicleDetailViewController(vehicle: Vehicle)
//        navigationController?.pushViewController(viewController, animated: true)
//    }
    
//    private func assembleVehiclesListViewController(delegate: VehiclesListPresenterDelegate) -> VehiclesListViewController {
//
//    }
    
//    private func assembleVehicleDetailViewController(vehicle: Vehicle) -> VehicleDetailViewController {
//
//    }
}
