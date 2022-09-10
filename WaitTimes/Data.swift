//
//  Data.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import Foundation

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

struct Park: Codable {
    var lands: [Land]
    var rides: [Ride]
}

struct Land: Codable {
    var id: Int
    var name: String
    var rides: [Ride]
}

struct Ride: Codable {
    var id: Int
    var name: String
    var is_open: Bool
    var wait_time: Int
    var last_updated: String
}
