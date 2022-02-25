//
//  NetworkError.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 22/02/2022.
//

import Foundation

public enum NetworkError: Error {
    case networkError
    case notFound
    case technicalError
    case technicalServerError
    
    init(statusCode: Int) {
        switch statusCode {
        case 404:
            self = .notFound
        case 400..<500:
            self = .technicalError
        case 500...:
            self = .technicalServerError
        default:
            self = .networkError
        }
    }
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound: return NSLocalizedString("not_found", comment: "")
        case .technicalError: return NSLocalizedString("technical_error", comment: "")
        case .technicalServerError: return NSLocalizedString("technical_server_error", comment: "")
        default: return NSLocalizedString("network_error", comment: "")
        }
    }
}
