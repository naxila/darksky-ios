//
//  MapCoordinatorAssembly.swift
//  Weather
//
//  Created by Алихан on 23/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MapCoordinatorAssembly {
    
    static func buildWith(output: MapCoordinatorOutput) -> MapCoordinator {

        // Creating components
        let coordinator = MapCoordinator()
        let router = MapCoordinatorRouter()
        
        // Injecting properties
        router.set(navigationController: output.navigationController() ?? UINavigationController())
        coordinator.set(output: output)
        coordinator.set(router: router)
        
        return coordinator
    }
    
}
