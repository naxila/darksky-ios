//
//  MainScreenInterface.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol MainScreenViewInput {
    func configureView()
    func configureFirstTabWith(headerView: UIViewController, listView: UIViewController)
    func configureSecondTabWith(headerView: UIViewController, listView: UIViewController)
}

protocol MainScreenViewOutput {
    func didTriggerViewReadyEvent()
}

protocol MainScreenModuleOutput {
    func didLoadFirstCity(weather: Weather, cityName: String)
    func didLoadSecondCity(weather: Weather, cityName: String)
}

protocol MainScreenModuleInput {
    func configureFirstScreenWith(headerView: UIViewController, listView: UIViewController)
    func configureSecondScreenWith(headerView: UIViewController, listView: UIViewController)
}
