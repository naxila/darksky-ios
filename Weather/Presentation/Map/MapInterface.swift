//
//  MapInterface.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol MapViewInput {
    func configureView()
    func updateHeaderWith(headerView: UIViewController)
    func startHeaderAnimating()
    func stopHeaderAnimating()
}

protocol MapViewOutput {
    func didTriggerViewReadyEvent()
    func didSelect(point: GeoPoint, with cityName: String)
    func didPressedListButton()
}

protocol MapModuleOutput {
    func mapViewDidTapBackButton()
    func mapViewDidUpdatedWith(weather: Weather, cityName: String)
}

protocol MapModuleInput {
    func updateMapViewWith(headerView: UIViewController)
}
