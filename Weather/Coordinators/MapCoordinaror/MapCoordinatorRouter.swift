//
//  MapCoordinatorRouter.swift
//  Weather
//
//  Created by Алихан on 23/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MapCoordinatorRouter {
    
    //MARK: - Properties
    private var navigationController: UINavigationController?
    
    
    //MARK: - Incapsulation
    
    func set(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}


//MARK: - Router

extension MapCoordinatorRouter: MapCoordinatorRouterInterface {
    
    func openMapScreenWith(output: MapModuleOutput) -> MapModuleInput? {
        let mapModule: (view: UIViewController?, input: MapModuleInput?) = MapAssembly.buildWith(output: output)
        
        if let mapScreen = mapModule.view {
            self.navigationController?.pushViewController(mapScreen, animated: true)
        }
        
        return mapModule.input
    }

}
