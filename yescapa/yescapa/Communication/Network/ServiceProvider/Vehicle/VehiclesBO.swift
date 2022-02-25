//
//  VehiclesBO.swift
//  yescapa
//
//  Created by PAGESY Noëline (i-BP - OPEN SAS) on 22/02/2022.
//

import Foundation

// MARK: - VehiculesBO
public struct VehiclesBO: Decodable {
    public let results: [VehicleBO]
}

// MARK: - VehicleBO
public struct VehicleBO: Decodable {
    public let id: Int
    public let title: String
    public let startingPrice: Int
    public let currencyUsed: CurrencyUsed
    public let reviewAverage: Double
    public let reviewCount: Int
    public let vehicleType: String
    public let vehicleBeds: Int
    public let vehicleSeats: Int
    public let vehicleLocationCity: String
    public let vehicleLocationZipcode: String
    public let vehicleOwnerFirstName: String
    public let vehicleOwnerLanguage: VehicleOwnerLanguage
    public let vehicleOwnerPictureURL: String
    public let url: String
    public let pictures: [Picture]

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

public enum CurrencyUsed: String, Decodable {
    case eur = "EUR"
}

// MARK: - Picture
public struct Picture: Decodable {
    public let id: String
    public let url: String
    
    public init(id: String, url: String) {
        self.id = id
        self.url = url
    }
}

public enum VehicleOwnerLanguage: String, Decodable {
    case fr = "FR"
}
