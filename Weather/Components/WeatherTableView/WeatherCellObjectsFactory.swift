//
//  WeatherCellObjectsFactory.swift
//  Weather
//
//  Created by Алихан on 21/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class WeatherCellObjectsFactory {
    func buildHourlyCellObjectsWith(weather: Weather, style: WeatherCellObject.Style) -> [TableViewCellObject] {
        var cellObjects: [TableViewCellObject] = []
        
        for hour in weather.hourly.data {
            cellObjects.append(WeatherCellObject(icon: hour.icon, temperature: hour.temperature, time: hour.time, summary: hour.summary, style: style))
        }
        
        return cellObjects
    }
    
    func buildDailyCellObjectsWith(weather: Weather, style: WeatherCellObject.Style) -> [TableViewCellObject] {
        var cellObjects: [TableViewCellObject] = []
        
        for day in weather.daily.data {
            cellObjects.append(WeatherCellObject(icon: day.icon, temperature: day.temperatureHigh, time: day.time, summary: day.summary, style: style))
        }
        
        return cellObjects
    }
    
}
