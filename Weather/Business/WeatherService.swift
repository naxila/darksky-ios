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
    
    //MARK: - Constants
    let apiKey = (Bundle.main.object(forInfoDictionaryKey: String.Bundle.apiKey) as? String) ?? String.empty
    let forecastPath = "forecast"
    let stPetersburgPoint = GeoPoint(latitude: 59.93863, longitude: 30.31413)
    let moscowPoint = GeoPoint(latitude: 39.9075, longitude: 116.3972)
    
    
    //MARK: - Service
    
    func forecastFor(geoPoint: GeoPoint, success: @escaping ((_ weather: Weather) -> Void), failure: @escaping ((_ errorMessage: String) -> Void)) {
        
        let path = "\(forecastPath)/\(apiKey)/\(geoPoint.latitude),\(geoPoint.longitude)"
        
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
                
                success(result)
            }
            
        }) { (statusCode, errorMessage) in
            failure(errorMessage ?? String.Network.Errors.undefined)
        }
    }
    
    func forecasForStPerersburg(success: @escaping ((_ weather: Weather) -> Void), failure: @escaping ((_ errorMessage: String) -> Void)) {
        self.forecastFor(geoPoint: self.stPetersburgPoint, success: success, failure: failure)
    }
    
    func forecasForMoscow(success: @escaping ((_ weather: Weather) -> Void), failure: @escaping ((_ errorMessage: String) -> Void)) {
        self.forecastFor(geoPoint: self.moscowPoint, success: success, failure: failure)
    }
    
}
