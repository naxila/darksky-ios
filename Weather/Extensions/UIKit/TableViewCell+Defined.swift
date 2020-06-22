//
//  TableViewCell+Defined.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    //MARK: - Properties
    
    enum ReuseIdentifier {
        
        enum Weather {
            static let item = "WeatherTableViewCell"
        }
        
    }
    
    //MARK: - Static
    
    static func nibFor(reuseIdentifier: String) -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
