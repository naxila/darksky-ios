//
//  MainScreenAssembly.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainScreenAssebly {
    
    static func buildWith(output: MainScreenModuleOutput) -> UIViewController {
        
        // Creating components
        guard let viewController = UIStoryboard.by(name: StoryboardName.main) as? MainViewController else {
            return UIViewController()
        }
        let presenter = MainScreenPresenter()
        
        // Injecting properties
        viewController.set(output: presenter)
        presenter.set(view: viewController)
        
        return viewController
        
    }
    
}
