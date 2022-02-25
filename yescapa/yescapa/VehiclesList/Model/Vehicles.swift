//
//  Vehicles.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 24/02/2022.
//

import Foundation
import Network

struct Vehicles {
    let list: [Vehicle]
    
    init(vehicles: VehiclesBO) {
        list = vehicles.results.map { Vehicle(id: $0.id,
                                              title: $0.title,
                                              price: $0.startingPrice,
                                              reviewAverage: $0.reviewAverage,
                                              reviewCount: $0.reviewCount,
                                              location: $0.vehicleLocationCity,
                                              ownerString: $0.vehicleOwnerFirstName,
                                              ownerPictureURL: $0.vehicleOwnerPictureURL,
                                              pictures: $0.pictures) }
    }
}
