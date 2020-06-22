//
//  MapPresenter.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MapPresenter {
    
    //MARK: - Properties
    private var output: MapModuleOutput?
    private var view: MapViewInput?
    private var service = WeatherService()
    
    //MARK: - Incapsulation
    
    func set(view: MapViewInput) {
        self.view = view
    }
    
    func set(output: MapModuleOutput) {
        self.output = output
    }
    
}


//MARK: - MapViewOutput

extension MapPresenter: MapViewOutput {
    
    func didTriggerViewReadyEvent() {
        self.view?.configureView()
    }
    
    func didSelect(point: GeoPoint, with cityName: String) {
        self.view?.startHeaderAnimating()
        self.service.forecastFor(geoPoint: point, success: { (weather) in
            self.output?.mapViewDidUpdatedWith(weather: weather, cityName: cityName)
            self.view?.stopHeaderAnimating()
        }) { (errorMessage) in
            self.view?.stopHeaderAnimating()
        }
    }
    
    func didPressedListButton() {
        self.output?.mapViewDidTapBackButton()
    }
}


//MARK: - MapModuleInput

extension MapPresenter: MapModuleInput {
    func updateMapViewWith(headerView: UIViewController) {
        self.view?.updateHeaderWith(headerView: headerView)
    }
}
