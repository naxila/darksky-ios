//
//  WeatherService.swift
//  Wheather
//
//  Created by Алихан on 19/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

class WeatherService {
    
    //MARK: - Properties
    let client = RequestService()
    
    //MARK: - Paths
    let forecastPath = "forecast"
    
    //MARK: - Constants
    let apiKey = (Bundle.main.object(forInfoDictionaryKey: String.Bundle.apiKey) as? String) ?? String.empty
    let stPetersburgPoint = GeoPoint(latitude: 59.938630, longitude: 30.314130)
    let moscowPoint = GeoPoint(latitude: 39.907500, longitude: 116.397200)
    
    
    //MARK: - Service
    
    func forecastFor(geoPoint: GeoPoint, success: @escaping ((_ weather: Weather) -> Void), failure: @escaping ((_ errorMessage: String) -> Void)) {
        
        let path = "\(forecastPath)/\(apiKey)/\(geoPoint.latitude),\(geoPoint.longitude)"
        
        if let storedWeather = self.storedWeatherFor(path: path) {
            let currentTimeInterval = Date().timeIntervalSince1970
            if currentTimeInterval - storedWeather.currently.time < 3600 {
                success(storedWeather)
                return
            }
        }
        
        self.client.get(path: path, parameters: nil, success: { (response) in
            if let response = response {
                
                guard let data = try? JSONSerialization.data(withJSONObject: response, options: .prettyPrinted) else {
                    failure(String.Network.Errors.undefined)
                    return
                }
                    
                let decoder = JSONDecoder()
                
                guard let result = try? decoder.decode(Weather.self, from: data) else {
                    failure(String.Network.Errors.undefined)
                    return
                }
                
                Storage.set(object: result, forKey: path)
                success(result)
            } else {
                if let storedWeather = self.storedWeatherFor(path: path) {
                    success(storedWeather)
                }
                
                failure(String.Network.Errors.undefined)
            }
            
        }) { (statusCode, errorMessage) in
            
            if let storedWeather = self.storedWeatherFor(path: path) {
                success(storedWeather)
            }
            
            failure(errorMessage ?? String.Network.Errors.undefined)
        }
    }
    
    func forecasForStPerersburg(success: @escaping ((_ weather: Weather) -> Void), failure: @escaping ((_ errorMessage: String) -> Void)) {
        self.forecastFor(geoPoint: self.stPetersburgPoint, success: success, failure: failure)
    }
    
    func forecasForMoscow(success: @escaping ((_ weather: Weather) -> Void), failure: @escaping ((_ errorMessage: String) -> Void)) {
        self.forecastFor(geoPoint: self.moscowPoint, success: success, failure: failure)
    }
    
    
    //MARK: - Storage
    
    private func storedWeatherFor(path: String) -> Weather? {
        return Storage.objectForKey(key: path, type: Weather.self)
    }
    
    private func store(weather: Weather, for path: String) {
        Storage.set(object: weather, forKey: path)
    }
}
