//
//  MainCoordinator.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator {
    
    //MARK: - Properties
    private var output: MainCoordinatorOutput?
    private var router: MainCoordinatorRouterInterface?
    
    
    //MARK: - Incapsulation
    
    func set(output: MainCoordinatorOutput) {
        self.output = output
    }
    
    func set(router: MainCoordinatorRouterInterface) {
        self.router = router
    }
    
    
    //MARK: - Private
    
    private func configureNavigationController() {
        self.navigationController()?.navigationBar.isHidden = true
    }
    
}


//MARK: - Coordinator

extension MainCoordinator: CoordinatorInterface {
    
    func start() {
        self.configureNavigationController()
        self.router?.openMainScreenWith(output: self)
    }
    
    func navigationController() -> UINavigationController? {
        return self.output?.navigationController()
    }
    
}


//MARK: - MainScreenOutput

extension MainCoordinator: MainScreenModuleOutput {
    
    func didPressedSwitchScreen() {
        //
    }
    
}
