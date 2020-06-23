//
//  Date+Helpers.swift
//  Weather
//
//  Created by Алихан on 23/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

extension Date {
    
    //MARK: Formatters
    
    func dateToString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
    
    func dateToStringWithTime() -> String {
        let dateString = self.dateToString(dateFormat: String.DateFormat.time)
        return dateString
    }
    
    func dateToStringWithTimeAndDate() -> String {
        let dateString = self.dateToString(dateFormat: String.DateFormat.timeAndDateWithoutYear)
        return dateString
    }
    
}

