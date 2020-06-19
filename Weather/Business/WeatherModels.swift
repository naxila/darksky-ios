//
//  WeatherModels.swift
//  Wheather
//
//  Created by Алихан on 19/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let timezone: String
    let currently: Currently
    let hourly: Hourly
    let daily: Daily

    struct Currently: Codable {
        let summary: String
        let temperature: Double
        let icon: String
    }
    
    struct Hourly: Codable {
        let summary: String
        let icon: String
        let data: [Hour]
        
        struct Hour: Codable {
            let time: TimeInterval
            let summary: String
            let icon: String
            let temperature: Double
        }
    }
  
    struct Daily: Codable {
        let data: [Day]
        
        struct Day: Codable {
            let time: TimeInterval
            let summary: String
            let icon: String
            let temperatureHigh, temperatureLow: Double
        }
    }
}

struct GeoPoint {
    let latitude: Double
    let longitude: Double
}
