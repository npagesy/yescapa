//
//  RequestError.swift
//  Network
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation

public enum RequestError: Error {
    case decodingError(Error)
    case urlComponents
}
