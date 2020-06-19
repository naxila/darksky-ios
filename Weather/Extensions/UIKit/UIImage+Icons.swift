//
//  UIImage+Icons.swift
//  Wheather
//
//  Created by Алихан on 18/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    //MARK: - Image Names
    
    enum Icons {
        enum Wheather: String {
            case clearDay = "clear_day"
            case clearNight = "clear_night"
            case partlyCloudyDay = "partly_cloud_day"
            case partlyCloudNight = "partly_cloud_night"
            case cloudy = "cloudy"
            case rain = "rain"
            case sleet = "sleet"
            case snow = "snow"
            case wind = "wind"
            case fog = "for"
        }
        
        enum App: String {
            case mapScreen = "main_screen"
            case listScreen = "list_screen"
            
            enum PullArrow: String {
                case down = "pull_arrow_down"
                case up = "pull_arrow_up"
                case direct = "pull_arrow"
            }
        }
    }
}
