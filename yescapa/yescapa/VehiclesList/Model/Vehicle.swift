//
//  Vehicle.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 25/02/2022.
//

import Foundation
import Network

struct Vehicle {
    let id: Int
    let title: String
    let price: Int
    let reviewAverage: Double
    let reviewCount: Int
    let location: String
    let ownerString: String
    let ownerPictureURL: String
    let pictures: [Picture]
    
    func getFormattedStartingPrice() -> String {
        "\(price)€/j"
    }
}
