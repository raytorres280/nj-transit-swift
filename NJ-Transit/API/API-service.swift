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
    //static var stations = [Station]()
    static var trains = [Train]()
    
    static func fetchAllStations() -> Future<[Station]> {
        let route = URL(string: baseURL + "stations")!
        return Future { completion in
            URLSession.shared.dataTask(with: route) { (data, response, err) in
                guard let data = data else { return }
                let result = formatStations(data: data)
                if(result.err != nil) {
                    completion(.failure(result.err!))
                    return
                } else {
                    completion(.success(result.stations!))
                    return
                }
                //if other ui elemenets depend on this, change to observer/subscriber pattern.
                //APIService.stations = stations
            }.resume()
        }
    }
    
    static func findRoute(from startId: Int, to endId: Int) -> Future<[Stop]> {
        let route = URL(string: baseURL + "route/\(startId)/\(endId)")!
        return Future { completion in
            URLSession.shared.dataTask(with: route) { (data, response, err) in
                guard let data = data else { return }
                let result = formatStations(data: data)
                if(result.err != nil) {
                    completion(.failure(result.err!))
                    return
                } else {
                    completion(.success(result.stations!))
                    return
                }
                //if other ui elemenets depend on this, change to observer/subscriber pattern.
                //APIService.stations = stations
                }.resume()
        }
        
    }
    
    private static func formatStations(data: Data) -> (stations: [Station]?, err: Error?) {
        do {
            let coder = JSONDecoder()
            coder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            let stations = try coder.decode([Station].self, from: data)
            return (stations, nil)
        } catch let jsonErr {
            print("\n" + jsonErr.localizedDescription)
            return ([], jsonErr)
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
