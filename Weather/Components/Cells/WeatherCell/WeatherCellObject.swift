//
//  WeatherCellObject.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

struct WeatherCellObject {
    
    //MARK: - Properties
    let icon: String
    let temperature: Double
    let time: TimeInterval
    let summary: String
    let style: Style
    
    enum Style {
        case dark
        case light
    }
    
}


//MARK: - CellObject

extension WeatherCellObject: TableViewCellObject {
    
    func cellReuseIdentifier() -> String {
        return UITableViewCell.ReuseIdentifier.Weather.item
    }
    
    func height() -> CGFloat {
        return 64
    }
    
}
