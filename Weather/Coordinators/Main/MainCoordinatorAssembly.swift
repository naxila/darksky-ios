//
//  MainCoordinatorAssembly.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinatorAssembly {
    
    static func buildWith(output: MainCoordinatorOutput) -> MainCoordinator {

        // Creating components
        let coordinator = MainCoordinator()
        let router = MainCoordinatorRouter()
        
        // Injecting properties
        router.set(navigationController: output.navigationController() ?? UINavigationController())
        coordinator.set(output: output)
        coordinator.set(router: router)
        
        return coordinator
    }
    
}
