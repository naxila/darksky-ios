//
//  MainScreenPresenter.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainScreenPresenter {
    
    //MARK: - Properties
    private var view: MainScreenViewInput?
    private let service = WeatherService()
    private var output: MainScreenModuleOutput?
    
    
    //MARK: Incapsulation
    
    func set(view: MainScreenViewInput) {
        self.view = view
    }
    
    func set(output: MainScreenModuleOutput) {
        self.output = output
    }
    
    
    //MARK: - Private
    
    private func loadStPetersBurg() {
        self.service.forecasForStPerersburg(success: { (weather) in
            self.output?.didLoadFirstCity(weather: weather, cityName: "St. Petersburg")
        }) { (errorMessage) in
            //obtain error
        }
    }
    
    private func loadMoscow() {
        self.service.forecasForMoscow(success: { (weather) in
            self.output?.didLoadSecondCity(weather: weather, cityName: "Moscow")
        }) { (errorMessage) in
            //obtain error
        }
    }
    
}


//MARK: - ViewOutput

extension MainScreenPresenter: MainScreenViewOutput {
    
    func didTriggerViewReadyEvent() {
        self.view?.configureView()
        self.loadStPetersBurg()
        self.loadMoscow()
    }
    
    func didPressedMapButton() {
        self.output?.didPressedMapButton()
    }
    
}

//MARK: - ModuleInput

extension MainScreenPresenter: MainScreenModuleInput {
    
    func configureFirstScreenWith(headerView: UIViewController, listView: UIViewController) {
        self.view?.configureFirstTabWith(headerView: headerView, listView: listView)
    }
    
    func configureSecondScreenWith(headerView: UIViewController, listView: UIViewController) {
        self.view?.configureSecondTabWith(headerView: headerView, listView: listView)
    }
    
}
