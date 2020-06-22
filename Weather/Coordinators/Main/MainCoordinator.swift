//
//  MainCoordinator.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator {
    
    //MARK: - Properties
    private var output: MainCoordinatorOutput?
    private var router: MainCoordinatorRouterInterface?
    private var mainModuleInput: MainScreenModuleInput?
    
    
    //MARK: - Incapsulation
    
    func set(output: MainCoordinatorOutput) {
        self.output = output
    }
    
    func set(router: MainCoordinatorRouterInterface) {
        self.router = router
    }
    
    
    //MARK: - Private
    
    private func configureNavigationController() {
        self.navigationController()?.navigationBar.isHidden = true
    }
    
}


//MARK: - Coordinator

extension MainCoordinator: CoordinatorInterface {
    
    func start() {
        self.configureNavigationController()
        self.mainModuleInput = self.router?.openMainScreenWith(output: self)
    }
    
    func navigationController() -> UINavigationController? {
        return self.output?.navigationController()
    }
    
}


//MARK: - MainScreenOutput

extension MainCoordinator: MainScreenModuleOutput {
    
    func didLoadFirstCity(weather: Weather, cityName: String) {
        let headerView = WeatherHeaderAssembly.buildWith(output: self, weather: weather, cityName: cityName)
        let listView = DailyListAssembly.buildListWith(weather: weather)
        
        self.mainModuleInput?.configureFirstScreenWith(headerView: headerView, listView: listView)
    }
    
    func didLoadSecondCity(weather: Weather, cityName: String) {
        let headerView = WeatherHeaderAssembly.buildWith(output: self, weather: weather, cityName: cityName)
         let listView = DailyListAssembly.buildListWith(weather: weather)
        self.mainModuleInput?.configureSecondScreenWith(headerView: headerView, listView: listView)
    }
    
    func didPressedMapButton() {
        self.router?.openMapScreen(output: self)
    }
    
}


//MARK: - WeatherHeader

extension MainCoordinator: WeatherHeaderModuleOutput {
    //
}


//MARK: - MapModuleOutput

extension MainCoordinator: MapCoordinatorOutput {
    
    func didFinishMapCoordinator() {
        self.navigationController()?.popViewController(animated: true)
    }
    
}
