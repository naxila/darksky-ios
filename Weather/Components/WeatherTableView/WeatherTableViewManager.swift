//
//  WeatherTableViewManager.swift
//  Weather
//
//  Created by Алихан on 21/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class WeatherTableViewManager: NSObject {
    
    //MARK: Properties
    private var tableView: UITableView?
    private var cellObjects: [TableViewCellObject]?
    
    //MARK: - Incapsulation
    
    func set(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(UITableViewCell.nibFor(reuseIdentifier: UITableViewCell.ReuseIdentifier.Weather.item), forCellReuseIdentifier: UITableViewCell.ReuseIdentifier.Weather.item)
    }
    
    //MARK: Functions
    
    func updateWith(cellObjects: [TableViewCellObject]) {
        self.cellObjects = cellObjects
        self.tableView?.reloadData()
    }
    
    func reloadData() {
        self.tableView?.reloadData()
    }
    
}


//MARK: UITableViewDataSource

extension WeatherTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellObject = self.cellObjects?[indexPath.row] else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.ReuseIdentifier.Weather.item, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureWith(cellObject: cellObject)
        return cell
    }
    
}


//MARK: UITableViewDelegate

extension WeatherTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellObjects?[indexPath.row].height() ?? 0
    }
    
}
