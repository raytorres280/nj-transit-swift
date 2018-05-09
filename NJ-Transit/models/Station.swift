//
//  Station.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/8/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation

struct Station: Decodable {
    let id: Int
    let name: String
    let createdAt: Date
    let updatedAt: Date
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        createdAt = json["createdAt"] as? Date ?? Date()
//        updatedAt = json["updatedAt"] as? Date ?? Date()
//    }
}
