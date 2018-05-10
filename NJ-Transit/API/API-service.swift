//
//  API-service.swift
//  NJ-Transit
//
//  Created by Raymond Torres on 5/8/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation
import Microfutures

let baseURL = "http://localhost:3000/"

class APIService {
    static var stations = [Station]()
    static var trains = [Train]()
    
    static func fetchAllStations() -> Future<[Station]> {
        let route = URL(string: baseURL + "stations")!
        return Future { completion in
            URLSession.shared.dataTask(with: route) { (data, response, err) in
                guard let data = data else { return }
                do {
                    let coder = JSONDecoder()
                    coder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    let stations = try coder.decode([Station].self, from: data)
                    APIService.stations = stations
                    print(APIService.stations.count)
                    completion(.success(stations))
                    return
                    //                let station = Station(json: json)
                } catch let jsonErr {
                    print(jsonErr)
                    completion(.failure(jsonErr))
                    return
                }
            }.resume()
        }
    }
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
