//
//  API-service.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/8/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation

let baseURL = "http://localhost:3000/"

class APIService {
    static var stations = [Station]()
    static var trains = [Train]()
    
    func fetchAllStations() {
        guard let route = URL(string: baseURL + "stations") else { return }
        URLSession.shared.dataTask(with: route) { (data, response, err) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                APIService.stations = try decoder.decode([Station].self, from: data)
                print(APIService.stations.count)
                
//                let station = Station(json: json)
            } catch let jsonErr {
                print("error", jsonErr)
            }
            
        }
    }
}
