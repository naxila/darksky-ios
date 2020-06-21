//
//  RequestService.swift
//  Wheather
//
//  Created by Алихан on 19/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import Alamofire

class RequestService {
    
    //MARK: - Constants
    let baseURL = (Bundle.main.object(forInfoDictionaryKey: String.Bundle.baseUrl) as? String) ?? String.empty
    
    //MARK: - Private
    
    private func obtainRequest(path: String,
                               method: HTTPMethod,
                               parameters: [String : Any]?,
                               success: ((Any?) -> Void)?,
                               failure: ((Int, String?) -> Void)?) {
        
        let path = "\(self.baseURL)/\(path)"
        
        AF.request(path,
                   method: method,
                   parameters: parameters,
                   encoding: URLEncoding.queryString,
                   headers: nil).responseJSON { (dataResponse) in
            self.obtainResponse(dataResponse: dataResponse, success: success, failure: failure)
        }
        
    }
    
    private func obtainResponse(dataResponse: AFDataResponse<Any>,
                                success: ((Any?) -> Void)?,
                                failure: ((Int, String?) -> Void)?) {
        
        let response = try? dataResponse.result.get()
        let error = dataResponse.error
        let statusCode = dataResponse.response?.statusCode
        
        switch statusCode {
        case 200:
            success?(response)
            break
        case -1:
            failure?(statusCode ?? 0, String.Network.Errors.noInternet)
            break
        default:
            failure?(statusCode ?? 0, error?.localizedDescription)
            break
        }
    }
}


//MARK: - Client

extension RequestService: APIClient {
    
    func get(path: String,
             parameters: [String : Any]?,
             success: ((Any?) -> Void)?,
             failure: ((Int, String?) -> Void)?) {
        
        self.obtainRequest(path: path, method: .get, parameters: parameters, success: success, failure: failure)
    }
    
    func post(path: String,
              parameters: [String : Any]?,
              success: ((Any?) -> Void)?,
              failure: ((Int, String?) -> Void)?) {
        
        self.obtainRequest(path: path, method: .post, parameters: parameters, success: success, failure: failure)
    }
    
}
