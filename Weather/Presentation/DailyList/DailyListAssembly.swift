//
//  DailyListAssembly.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class DailyListAssembly {
    
    static func buildListWith(weather: Weather) -> UIViewController {
        
        // Creating components
        let viewController = DailyListViewController(nibName: NibNames.Views.dailyList, bundle: nil)
        
        // Injecting properties
        viewController.set(weather: weather)
        
        return viewController
        
    }
    
}
