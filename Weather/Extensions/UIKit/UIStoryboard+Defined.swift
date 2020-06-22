//
//  UIStoryboard+Defined.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Constants

enum StoryboardName {
    static let main = "Main"
    static let map = "Map"
}

enum NibNames {
    
    enum Views {
        static let weatherHeader = "WeatherHeaderView"
        static let dailyList = "DailyListView"
    }
    
}

extension UIStoryboard {
    
    static func by(name: String) -> UIViewController {
        return self.init(name: name, bundle: nil).instantiateViewController(withIdentifier: name) as UIViewController
    }
    
}
