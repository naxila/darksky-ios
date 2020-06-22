//
//  BaseTableViewCell.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewCell {
    func configureWith(cellObject: TableViewCellObject)
}
