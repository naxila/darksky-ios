//
//  MainCoordinatorRouter.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinatorRouter {
    
    //MARK: - Properties
    private var navigationController: UINavigationController?
    
    
    //MARK: - Incapsulation
    
    func set(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}


//MARK: - Router

extension MainCoordinatorRouter: MainCoordinatorRouterInterface {
    
    func openMapScreen(output: MapCoordinatorOutput) {
        let mapCoordinator = MapCoordinatorAssembly.buildWith(output: output)
        mapCoordinator.start()
    }
    
    func openMainScreenWith(output: MainScreenModuleOutput) -> MainScreenModuleInput? {
        
        let mainModule: (view: UIViewController?, input: MainScreenModuleInput?) = MainScreenAssembly.buildWith(output: output)
        
        if let mainScreen = mainModule.view {
            self.navigationController?.pushViewController(mainScreen, animated: true)
        }
        
        return mainModule.input
    }
    
}
