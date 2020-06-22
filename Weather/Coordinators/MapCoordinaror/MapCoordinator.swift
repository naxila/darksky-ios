//
//  MapCoordinator.swift
//  Weather
//
//  Created by Алихан on 23/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MapCoordinator {
    
    //MARK: - Properties
    private var output: MapCoordinatorOutput?
    private var router: MapCoordinatorRouterInterface?
    private var mapModuleInput: MapModuleInput?
    
    
    //MARK: - Incapsulation
    
    func set(output: MapCoordinatorOutput) {
        self.output = output
    }
    
    func set(router: MapCoordinatorRouterInterface) {
        self.router = router
    }
    
}


//MARK: - Coordinator

extension MapCoordinator: CoordinatorInterface {
    
    func start() {
        self.mapModuleInput = self.router?.openMapScreenWith(output: self)
    }
    
    func navigationController() -> UINavigationController? {
        return self.output?.navigationController()
    }
    
}


//MARK: - MapModuleOutput

extension MapCoordinator: MapModuleOutput {
    
    func mapViewDidUpdatedWith(weather: Weather, cityName: String) {
        let headerView = WeatherHeaderAssembly.buildWith(output: self, weather: weather, cityName: cityName)
        self.mapModuleInput?.updateMapViewWith(headerView: headerView)
    }
    
    func mapViewDidTapBackButton() {
        self.navigationController()?.popViewController(animated: true)
    }
    
}


//MARK: - WeatherHeaderOutput

extension MapCoordinator: WeatherHeaderModuleOutput {
    //
}
