//
//  CityCell.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/10/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var weatherIconImgView: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
  
    var weatherDescription = ""
    var wind = 0.0
    var clouds = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCityCell(city: City) {
        cityName.text = city.cityName
        weatherIconImgView.image = UIImage(named: city.weatherType)
        weatherType.text = city.weatherType
        maxTemp.text = city.maxTemp
        lowTemp.text = city.minTemp
        weatherDescription = city.weatherDescription.capitalized
        wind = city.wind
        clouds = city.clouds
    }
}
