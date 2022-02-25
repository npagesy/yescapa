//
//  AppDIContainer.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation
import Network
import UIKit

final class AppDIContainer {
    lazy var webServiceProviderManager: ServiceProviderHelperProtocol = URLSessionServiceProvider()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
       let router = AppRouter(navigationController: navigationController, webServiceProviderManager: webServiceProviderManager)
        router.startApplication()
    }
}
