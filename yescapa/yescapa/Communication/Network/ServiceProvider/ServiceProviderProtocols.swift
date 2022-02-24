//
//  ServiceProviderProtocols.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation

public protocol ServiceProviderProtocol {
    func execute(route: NetworkRouterProtocol, completion: @escaping (Result<Data, Error>) -> Void)
}

public protocol ServiceProviderHelperProtocol {
    var vehicles: VehicleServiceProviderProtocol { get }
}
