//
//  Decoder.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 23/02/2022.
//

import Foundation

struct Decoder<T> where T: Decodable {
    func decode(from data: Data) throws -> T {
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            Logger.log(level: .error, "Erreur lors de la")
            throw NetworkError.technicalError
        }
    }
}
