//
//  Stop.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/16/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation

struct Stop: Decodable {
    let id: Int
    let time: String
    let routeStopNumber: Int
    let createdAt: Date
    let updatedAt: Date
    let Station: Station
    let TrainId: Int
    let StationId: Int
}
