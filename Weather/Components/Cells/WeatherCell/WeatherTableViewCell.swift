//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Алихан on 22/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImageView.image = nil
        self.summaryLabel.text = nil
        self.timeLabel.text = nil
    }
    
    
    //MARK: - Private
    
    private func setupAppearenceWith(style: WeatherCellObject.Style) {
        self.summaryLabel.textColor = style == .dark ? UIColor.WeatherCell.dark() : UIColor.WeatherCell.light()
        self.timeLabel.textColor = style == .dark ? UIColor.WeatherCell.dark() : UIColor.WeatherCell.light()
    }
    
}


//MARK: - BaseCell

extension WeatherTableViewCell: BaseTableViewCell {
    func configureWith(cellObject: TableViewCellObject) {
        if let weatherCellObject = cellObject as? WeatherCellObject {
            self.iconImageView.image = UIImage(named: weatherCellObject.icon)
            self.setupAppearenceWith(style: weatherCellObject.style)
            self.summaryLabel.text = String(format: "%0.f °C, %@", (weatherCellObject.temperature - 32) * 5/9, weatherCellObject.summary)
            self.timeLabel.text = Date(timeIntervalSince1970: weatherCellObject.time).description
        }
    }
}
