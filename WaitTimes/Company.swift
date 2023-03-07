//
//  Company.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import SwiftUI

struct Company: Codable {
    let id: Int
    let name: String
    let parks: [CompanyPark]

    /*
     "id": 11,
     "name": "Cedar Fair Entertainment Company",
     "parks": [ParkData]
     */
}

struct CompanyPark: Codable {
    let id: Int
    let name: String
    let country: String
    let continent: String
    let latitude: String
    let longitude: String
    let timezone: String

    /*
     "id": 57,
     "name": "California's Great America",
     "country": "United States",
     "continent": "North America",
     "latitude": "37.397799",
     "longitude": "-121.974717",
     "timezone": "America/Los_Angeles"
     */
}
