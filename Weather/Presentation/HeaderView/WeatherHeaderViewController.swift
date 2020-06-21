//
//  WeatherViewController.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    private var output: WeatherHeaderViewOutput?

    //MARK: - Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var hourlyTableView: UITableView!
    
    //MARK: - Incapsulation

    func set(output: WeatherHeaderViewOutput) {
       self.output = output
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output?.didTriggerViewReadyEvent()
    }
}

//MARK: - WeatherViewController

extension WeatherViewController: WeatherHeaderViewInput {
    func configureViewWith(weather: Weather, cityName: String) {
        self.cityNameLabel.text = cityName
        self.temperatureLabel.text = String(format: "%0.f °C, %@", (weather.currently.temperature - 32) * 5/9, weather.currently.summary)
        self.iconImageView.image = UIImage(named: weather.currently.icon)
    }
}
