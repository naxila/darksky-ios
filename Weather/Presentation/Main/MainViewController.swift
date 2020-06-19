//
//  MainViewController.swift
//  Wheather
//
//  Created by Алихан on 18/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Properties
    private var output: MainScreenViewOutput?
    
    
    //MARK: - Incapsulation
    
    func set(output: MainScreenViewOutput) {
        self.output = output
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let service = WeatherService()
        
        service.forecasForMoscow(success: { (weather) in
            print(weather)
        }) { (errorMessage) in
            print(errorMessage)
        }
    }

}


//MARK: - ViewInput

extension MainViewController: MainScreenViewInput {
    
    func configureView() {
        //
    }
    
}

