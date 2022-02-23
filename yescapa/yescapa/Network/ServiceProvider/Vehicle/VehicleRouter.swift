//
//  VehicleRouter.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation

public enum VehicleRouter: NetworkRouterProtocol {
    case getVehicles
    
    public var urlString: String { "https://gitlab.com" }
    public var method: String { "GET" }
    public var path: String { "/yescapa-pub/jobs/-/raw/master/iOS/data.json" }
}
