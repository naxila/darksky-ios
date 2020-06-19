//
//  MainScreenPresenter.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class MainScreenPresenter {
    
    //MARK: - Properties
    private var view: MainScreenViewInput?
    
    
    //MARK: Incapsulation
    
    func set(view: MainScreenViewInput) {
        self.view = view
    }
    
}


//MARK: - ViewOutput

extension MainScreenPresenter: MainScreenViewOutput {
    func didTriggerViewReadyEvent() {
        //
    }
}
