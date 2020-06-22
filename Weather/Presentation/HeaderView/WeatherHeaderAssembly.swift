//
//  WeatherHeaderAssembly.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class WeatherHeaderAssembly {
    
    static func buildWith(output: WeatherHeaderModuleOutput, weather: Weather, cityName: String) -> UIViewController {
        
        // Creating components
        let viewController = WeatherViewController(nibName: NibNames.Views.weatherHeader, bundle: nil)
        let presenter = WeatherHeaderPresenter()
        
        // Injecting properties
        viewController.set(output: presenter)
        presenter.set(view: viewController)
        presenter.set(weather: weather)
        presenter.set(cityName: cityName)
        
        return viewController
        
    }
    
}
