//
//  VehicleServiceProvider.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation

public protocol VehicleServiceProviderProtocol {
    func getVehicles(completion: @escaping (VehiclesBO?) -> Void)
}

class VehicleServiceProvider: URLSessionServiceProvider, VehicleServiceProviderProtocol {
    func getVehicles(completion: @escaping (VehiclesBO?) -> Void) {
        execute(route: VehicleRouter.getVehicles) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                do {
                    let vehicles = try Decoder<VehiclesBO>().decode(from: data)
                    Logger.log(level: .debug, vehicles)
                    completion(vehicles)
                } catch {
                    completion(nil)
                }
            case .failure(let error):
                Logger.log(level: .error, error)
                completion(nil)
            }
        }
    }
}
