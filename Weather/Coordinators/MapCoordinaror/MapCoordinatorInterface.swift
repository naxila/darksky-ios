//
//  MapCoordinatorInterface.swift
//  Weather
//
//  Created by Алихан on 23/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

protocol MapCoordinatorOutput: CoordinatorInterface {
    func didFinishMapCoordinator()
}

protocol MapCoordinatorRouterInterface {
    func openMapScreenWith(output: MapModuleOutput) -> MapModuleInput?
}
