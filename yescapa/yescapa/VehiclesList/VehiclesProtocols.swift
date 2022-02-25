//
//  VehiclesProtocols.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 24/02/2022.
//

import Foundation
import UIKit

protocol VehiclesPresenterProtocol {
    func didLoad()
    func numberOfRows() -> Int
    func willShow(cell: VehicleTableViewCellProtocol, indexPath: IndexPath)
    func didSelect(indexPath: IndexPath)
}

protocol VehiclesViewControllerProtocol: AnyObject {
    func reloadData()
    func show(viewController: UIViewController)
}
