//
//  VehicleServiceProviderMock.swift
//  yescapaTests
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import Network

enum ServiceProviderError: Error {
    case testError
}

class ServiceProviderMock: ServiceProviderHelperProtocol {
    var vehicles: VehicleServiceProviderProtocol { return VehicleServiceProviderMock() }
}

class VehicleServiceProviderMock: VehicleServiceProviderProtocol {
    func getVehicles(completion: @escaping (Result<VehiclesBO?, Error>) -> Void) {
        do {
            guard let data = vehiclesBO.data(using: .utf8) else {
                completion(.failure(ServiceProviderError.testError))
                return
            }
            let vehiclesBO = try JSONDecoder().decode(VehiclesBO.self, from: data)
            completion(.success(vehiclesBO))
        } catch {
            completion(.failure(error))
        }
    }
}
