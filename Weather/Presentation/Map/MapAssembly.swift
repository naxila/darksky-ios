//
//  MapAssembly.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MapAssembly {
    
    static func buildWith(output: MapModuleOutput) -> (view: UIViewController?, input: MapModuleInput?) {
        
       // Creating components
        guard let viewController = UIStoryboard.by(name: StoryboardName.map) as? MapViewController else {
            return (nil, nil)
        }
        let presenter = MapPresenter()
        
        // Injecting properties
        presenter.set(view: viewController)
        presenter.set(output: output)
        viewController.set(output: presenter)
        
        return (viewController, presenter)
    }
    
}
