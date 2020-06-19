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
    
    func openMainScreenWith(output: MainScreenModuleOutput) {
        let mainScreen = MainScreenAssebly.buildWith(output: output)
        self.navigationController?.pushViewController(mainScreen, animated: true)
    }
    
}
