//
//  Coordinator.swift
//  Wheather
//
//  Created by Алихан on 19/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    
    //MARK: - Properties
    private var navController = UINavigationController()
    
    //MARK: - UI
    
    func configureNavigationController() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.topItem?.hidesBackButton = true
    }
    
    
    //MARK: - Private
    
    private func showMainScreen() {
        let mainCoordinator = MainCoordinatorAssembly.buildWith(output: self)
        mainCoordinator.start()
    }
}


//MARK: - CoordinatorType

extension Coordinator: CoordinatorInterface {
    
    func start() {
        self.navController = UINavigationController()
        UIApplication.shared.delegate?.window??.rootViewController = self.navController;
        UIApplication.shared.delegate?.window??.rootViewController?.view.layoutSubviews()
        self.configureNavigationController()
        
        self.showMainScreen()
    }
    
    func navigationController() -> UINavigationController? {
        return self.navController
    }
    
}


//MARK: - MainCoordinatorOutput

extension Coordinator: MainCoordinatorOutput {
    
    func didFinishMainCoordinator() {
        //do nothing
    }
    
}

