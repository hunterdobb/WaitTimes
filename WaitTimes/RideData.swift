//
//  Data.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import Foundation

struct Park: Codable {
    let lands: [Land]
    let rides: [Ride]
}

struct Land: Codable {
    let id: Int
    let name: String
    let rides: [Ride]
}

struct Ride: Codable {
    let id: Int
    let name: String
    let is_open: Bool
    let wait_time: Int
    let last_updated: String
}


/*
"lands": [LAND]
 // ex land
    "id": 275,
    "name": "Jurassic Park",
    "rides": [RIDE]
 //     ex ride
        "id": 6017,
        "name": "Skull Island: Reign of Kong™",
        "is_open": true,
        "wait_time": 20,
        "last_updated": "2022-09-10T16:36:11.000Z"

"rides": []
 */
