//
//  WeatherHeaderPresenter.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class WeatherHeaderPresenter {
    
    //MARK: - Properties
    private var view: WeatherHeaderViewInput?
    private var weather: Weather?
    private let service = WeatherService()
    private var cityName: String?
    
    
    //MARK: Incapsulation
    
    func set(view: WeatherHeaderViewInput) {
        self.view = view
    }
    
    func set(weather: Weather) {
        self.weather = weather
    }
    
    func set(cityName: String) {
        self.cityName = cityName
    }
}

//MARK: - WeatherHeaderPresenter

extension WeatherHeaderPresenter: WeatherHeaderViewOutput {
    func didTriggerViewReadyEvent() {
        if let weather = self.weather {
            self.view?.configureViewWith(weather: weather, cityName: self.cityName ?? String.empty)
        }
    }
}
