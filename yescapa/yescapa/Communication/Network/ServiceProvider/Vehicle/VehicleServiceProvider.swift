//
//  VehicleServiceProvider.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation

public protocol VehicleServiceProviderProtocol {
    func getVehicles(completion: @escaping (Result<VehiclesBO?, Error>) -> Void)
}

final class VehicleServiceProvider: URLSessionServiceProvider, VehicleServiceProviderProtocol {
    func getVehicles(completion: @escaping (Result<VehiclesBO?, Error>) -> Void) {
        execute(route: VehicleRouter.getVehicles) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                do {
                    let vehicles = try Decoder<VehiclesBO>().decode(from: data)
                    DispatchQueue.main.async { completion(.success(vehicles)) }
                } catch {
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            case .failure(let error):
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }
    }
}
