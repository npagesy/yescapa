//
//  URLSessionServiceProvider.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 22/02/2022.
//

import Foundation

public class URLSessionServiceProvider: ServiceProviderProtocol {
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    
    public init() {}
    
    public func execute(route: NetworkRouterProtocol, completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            let request = try route.asURLRequest()
            let urlSession = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    completion(.failure(NetworkError.networkError))
                    return
                }
                
                guard let urlResponse = response as? HTTPURLResponse else { return completion(.failure(NetworkError.technicalError)) }
                if !(200..<300).contains(urlResponse.statusCode) {
                    return completion(.failure(NetworkError(statusCode: urlResponse.statusCode)))
                }
                
                guard let data = data else { return }
                completion(.success(data))
                return
            }
            urlSession.resume()
        } catch {
            completion(.failure(NetworkError.technicalError))
        }
    }
}

extension URLSessionServiceProvider: ServiceProviderHelperProtocol {
    public var vehicles: VehicleServiceProviderProtocol { return VehicleServiceProvider() }
}
