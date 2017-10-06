//
//  ForecastCollectionCell.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/09/28.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class ForecastCollectionCell: UICollectionViewCell {
    @IBOutlet weak var dayMinMax: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var weatherTypeIcon: UIImageView!
    
    func configureCollectionCell(forecast: Forecast) {
        let minTemp = String(forecast.lowTemp.characters.prefix(2))
        let maxTemp = String(forecast.highTemp.characters.prefix(2))
        dayMinMax.text = "\(forecast.date) \(minTemp)° \(maxTemp)°"
        weatherType.text = forecast.weatherType
        weatherTypeIcon.image = UIImage(named: forecast.weatherType)
    }
}
