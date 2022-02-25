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
    private var webServiceProviderManager: ServiceProviderHelperProtocol

    init(navigationController: UINavigationController, webServiceProviderManager: ServiceProviderHelperProtocol) {
        self.navigationController = navigationController
        self.webServiceProviderManager = webServiceProviderManager
    }
    
    func startApplication() {
        let viewController = assembleVehiclesListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    private func assembleVehiclesListViewController() -> VehiclesTableViewController {
        let delegate = VehiclesPresenterDelegate(showVehicle: showVehicleDetail)
        let viewController = VehiclesTableViewController()
        viewController.presenter = VehiclesPresenter(view: viewController, manager: webServiceProviderManager, delegate: delegate)
        return viewController
    }
    
    private func showVehicleDetail(vehicle: Vehicle) {
        let viewController = assembleVehicleDetailViewController(vehicle: vehicle)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func assembleVehicleDetailViewController(vehicle: Vehicle) -> VehicleDetailViewController {
        let viewController = VehicleDetailViewController()
        viewController.presenter = VehicleDetailPresenter(view: viewController, manager: webServiceProviderManager, vehicle: vehicle)
        return viewController
    }
}
