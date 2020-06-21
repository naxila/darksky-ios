//
//  AppDelegate.swift
//  Weather
//
//  Created by Алихан on 18/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Starting main coordinator
        let coordinator = Coordinator()
        coordinator.start()
        
        return true
    }

}

