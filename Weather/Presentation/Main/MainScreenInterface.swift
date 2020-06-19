//
//  MainScreenInterface.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation

protocol MainScreenViewInput {
    func configureView()
}

protocol MainScreenViewOutput {
    func didTriggerViewReadyEvent()
}

protocol MainScreenModuleOutput {
    func didPressedSwitchScreen()
}
