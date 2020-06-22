//
//  MainCoordinatorInterface.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

protocol MainCoordinatorOutput: CoordinatorInterface {
    func didFinishMainCoordinator()
}

protocol MainCoordinatorRouterInterface {
    func openMainScreenWith(output: MainScreenModuleOutput) -> MainScreenModuleInput?
    func openMapScreen(output: MapCoordinatorOutput)
}
