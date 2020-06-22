//
//  MainScreenAssembly.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainScreenAssembly {
    
    static func buildWith(output: MainScreenModuleOutput) -> (view: UIViewController?, input: MainScreenModuleInput?) {
        
        // Creating components
        guard let viewController = UIStoryboard.by(name: StoryboardName.main) as? MainViewController else {
            return (nil, nil)
        }
        let presenter = MainScreenPresenter()
        
        // Injecting properties
        viewController.set(output: presenter)
        presenter.set(view: viewController)
        presenter.set(output: output)
        
        return (viewController, presenter)
    }
    
    static func buildWith(output: MainScreenModuleOutput) -> UIViewController? {
        return buildWith(output: output).view
    }
}
