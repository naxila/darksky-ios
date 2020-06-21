//
//  APIClientInterface.swift
//  Wheather
//
//  Created by Алихан on 19/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

protocol APIClient {
    
    func get(path: String,
             parameters: [String: Any]?,
             success: ((_ response: Any?) -> Void)?,
             failure: ((_ statusCode: Int, _ errorMessage: String?) -> Void)?)
    
    func post(path: String,
             parameters: [String: Any]?,
             success: ((_ response: Any?) -> Void)?,
             failure: ((_ statusCode: Int, _ errorMessage: String?) -> Void)?)
    
}
