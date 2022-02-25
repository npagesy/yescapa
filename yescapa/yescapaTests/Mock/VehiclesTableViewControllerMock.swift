//
//  VehiclesTableViewControllerMock.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import UIKit

@testable import yescapa

class VehiclesTableViewControllerMock: VehiclesViewControllerProtocol {
    var reloadDataCallStatus: Bool = false
    var showCallStatus: Bool = false
    
    func reloadData() {
        reloadDataCallStatus = true
    }
    
    func show(viewController: UIViewController) {
        showCallStatus = true
    }
}
