//
//  NetworkRouterProtocol.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 22/02/2022.
//

import Foundation

public protocol NetworkRouterProtocol {
    var urlString: String { get }
    var method: String { get }
    var path: String { get }
}

extension NetworkRouterProtocol {
    func asURLRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: urlString) else {
            throw RequestError.urlComponents
        }
        
        if !path.isEmpty { urlComponents.path += path }
        if let url = urlComponents.url {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method
            return urlRequest
        } else {
            throw RequestError.urlComponents
        }
    }
}
