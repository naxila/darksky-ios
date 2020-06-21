//
//  WeatherHeaderTableViewManager.swift
//  Weather
//
//  Created by Алихан on 21/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

class WeatherHeaderTableViewManager: NSObject {
    
    //MARK: Properties
    private var tableView: UITableView?
    private var cellObjects: [UITableViewCell]?
    
    //MARK: - Incapsulation
    
    func set(tableView: UITableView) {
        self.tableView = tableView
    }
    
    //MARK: Functions
    
    func updateWith(cellObjects: [UITableViewCell]) {
        self.cellObjects = cellObjects
        self.tableView?.reloadData()
    }
    
    func reloadData() {
        self.tableView?.reloadData()
    }
    
}


//MARK: UITableViewDataSource

extension WeatherHeaderTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellObject = self.cellObjects?[indexPath.row] else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? UITableViewCell else {
            return UITableViewCell()
        }
        
//        cell.configureWith(cellObject: cellObject)
        return cell
    }
    
}


//MARK: UITableViewDelegate

extension WeatherHeaderTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.cellObjects?[indexPath.row].height() ?? 0
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var newCellObjects = self.cellObjects
        
        for i in 0..<(newCellObjects?.count ?? 0) {
            if let _ = newCellObjects?[i] {
                newCellObjects![i].isSelected = false
            }
        }
        
        if let _ = newCellObjects?[indexPath.row] {
            newCellObjects![indexPath.row].isSelected = true
        }
        
        self.cellObjects = newCellObjects
        self.tableView?.reloadData()
    }
    
}
