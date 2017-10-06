//
//  DetailsVC.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/10/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherDescr: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var cloudsLbl: UILabel!
    
    var name: String!
    var weatherType: String!
    var weatherImg: UIImage!
    var temperature: String!
    var weatherDescription: String!
    var wind: Double!
    var clouds: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passedValues()
    }

    func passedValues() {
        cityName.text = name
        let tempCelcius = String(temperature.characters.prefix(2))
        let windString = String(format: "%.0f", wind)
        let cloudsString = String(format: "%.0f", clouds)
        temp.text = "\(tempCelcius)°"
        weatherIcon.image = weatherImg
        weatherDescr.text = weatherDescription
        windLbl.text = "Wind: \(windString) km/h"
        cloudsLbl.text = "Clouds cover: \(cloudsString) %"
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
