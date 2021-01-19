//
//  ExploreModel.swift
//  4sq_explore
//
//  Created by Macbook on 19/1/2564 BE.
//

import Foundation

struct Icon : Decodable {
    let prefix: String?
    let suffix: String?
    enum CodingKeys: String, CodingKey {
        case prefix = "prefix"
        case suffix = "suffix"
    }
}

struct Categories : Decodable {
    let icon : Icon?
    enum CodingKeys: String, CodingKey {
        case icon = "icon"
    }
}

struct Location : Decodable {
    let address: String?
    let crossStreet: String?
    let postalCode: String?
    let cc: String?
    let neighborhood: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case crossStreet = "crossStreet"
        case postalCode = "postalCode"
        case cc = "cc"
        case neighborhood = "neighborhood"
        case city = "city"
        case state = "state"
        case country = "country"
        case formattedAddress = "formattedAddress"
    }
}

struct Venue: Decodable {
    let name: String?
    let location: Location?
    let categories: [Categories]?
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case location = "location"
        case categories = "categories"
    }
}

struct Items: Decodable {
    let venue: Venue?
    enum CodingKeys: String, CodingKey {
        case venue = "venue"
    }
}

struct Groups: Decodable {
    let items: [Items]?
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

struct Response: Decodable {
    let groups: [Groups]?
    enum CodingKeys: String, CodingKey {
        case groups = "groups"
    }
}
struct Meta: Decodable {
    let code: Int?
    enum CodingKeys: String, CodingKey {
        case code = "code"
    }
}
struct ExploreModel: Decodable {
    let response: Response?
    let meta: Meta?
    enum CodingKeys: String, CodingKey {
        case response = "response"
        case meta = "meta"
    }
}
