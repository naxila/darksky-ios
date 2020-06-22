//
//  DailyListViewController.swift
//  Weather
//
//  Created by Алихан on 20/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class DailyListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var dailyTableView: UITableView!
    
    //MARK: - Properties
    private var manager = WeatherTableViewManager()
    private var factory = WeatherCellObjectsFactory()
    private var weather: Weather?
    
    //MARK: - Incapsulation
    
    func set(weather: Weather) {
        self.weather = weather
    }
    
    
    //MARK: - Lifecylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.set(tableView: self.dailyTableView)
        self.dailyTableView.delegate = self.manager
        self.dailyTableView.dataSource = self.manager
        
        if let weather = self.weather {
            self.manager.updateWith(cellObjects: self.factory.buildDailyCellObjectsWith(weather: weather, style: .dark))
        }
        
    }
    
}
