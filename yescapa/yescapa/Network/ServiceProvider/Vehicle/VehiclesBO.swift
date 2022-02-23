//
//  VehiclesBO.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 22/02/2022.
//

import Foundation

// MARK: - VehiculesBO
public struct VehiclesBO: Decodable {
    let vehicles: [VehicleBO]
}

// MARK: - VehicleBO
struct VehicleBO: Decodable {
    let id: Int
    let title: String
    let startingPrice: Int
    let currencyUsed: CurrencyUsed
    let reviewAverage: Double
    let reviewCount: Int
    let vehicleType: String
    let vehicleBeds: Int
    let vehicleSeats: Int
    let vehicleLocationCity: String
    let vehicleLocationZipcode: String
    let vehicleOwnerFirstName: String
    let vehicleOwnerLanguage: VehicleOwnerLanguage
    let vehicleOwnerPictureURL: String
    let url: String
    let pictures: [Picture]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case startingPrice = "starting_price"
        case currencyUsed = "currency_used"
        case reviewAverage = "review_average"
        case reviewCount = "review_count"
        case vehicleType = "vehicle_type"
        case vehicleBeds = "vehicle_beds"
        case vehicleSeats = "vehicle_seats"
        case vehicleLocationCity = "vehicle_location_city"
        case vehicleLocationZipcode = "vehicle_location_zipcode"
        case vehicleOwnerFirstName = "vehicle_owner_first_name"
        case vehicleOwnerLanguage = "vehicle_owner_language"
        case vehicleOwnerPictureURL = "vehicle_owner_picture_url"
        case url
        case pictures
    }
}

enum CurrencyUsed: String, Decodable {
    case eur = "EUR"
}

// MARK: - Picture
struct Picture: Decodable {
    let id: String
    let url: String
}

enum VehicleOwnerLanguage: String, Decodable {
    case fr = "FR"
}
