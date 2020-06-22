//
//  AppDelegate.swift
//  Weather
//
//  Created by Алихан on 18/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configure Google Maps
        let GMSAPIKey = (Bundle.main.object(forInfoDictionaryKey: String.Bundle.GMSAPIKey) as? String) ?? String.empty
        GMSServices.provideAPIKey(GMSAPIKey)
        
        // Starting main coordinator
        let coordinator = Coordinator()
        coordinator.start()
        
        return true
    }

}

