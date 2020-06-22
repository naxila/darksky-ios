//
//  WeatherHeaderInterface.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

protocol WeatherHeaderViewInput {
    func configureViewWith(tableViewManager: WeatherTableViewManager, weather: Weather, cityName: String)
}

protocol WeatherHeaderViewOutput {
    func didTriggerViewReadyEvent()
}

protocol WeatherHeaderModuleOutput {
    
}
