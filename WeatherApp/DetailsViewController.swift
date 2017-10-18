//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/10/02.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherDescr: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var cloudsLbl: UILabel!
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateUI()
    }

    func populateUI() {
        cityName.text = city?.cityName
        let windString = String(format: "%.0f", (city?.wind)!)
        let cloudsString = String(format: "%.0f", (city?.clouds)!)
        temp.text = (city?.maxTemp)! + "°"
        weatherIcon.image = UIImage(named:(city?.weatherType)!)
        weatherDescr.text = city?.weatherDescription
        windLbl.text = "Wind: \(windString) km/h"
        cloudsLbl.text = "Clouds cover: \(cloudsString) %"
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
