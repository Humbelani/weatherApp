//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/08/03.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = String(forecast.lowTemp.characters.prefix(2))
        highTemp.text = String(forecast.highTemp.characters.prefix(2))
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        
    }
}
