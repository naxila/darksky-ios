//
//  String+Defined.swift
//  Wheather
//
//  Created by Алихан on 19/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

extension String {
    
    //MARK: - Constants
    static let empty = ""
    
    
    //MARK: - Defined Strings
    
    enum Bundle {
        static let baseUrl = "BASE_URL"
        static let apiKey = "API_KEY"
        static let GMSAPIKey = "GMS_API_KEY"
    }
    
    enum Network {
        enum Errors {
            static let noInternet = "No internet connection"
            static let undefined = "Undefined network error"
        }
    }
    
    enum Weather {
        static let today = "Today"
    }
    
}
