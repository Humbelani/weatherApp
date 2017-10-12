//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/09/28.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import Alamofire

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var citiesTableView: UITableView!
    
    var cities = [City]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadCities{}
    }

    func downloadCities(completed: @escaping DownloadComplete) {

        let forecastURL = URL(string: CITIES_URL)!
        
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? StringToAnyObjectDictionary {
                if let list = dict["list"] as? [StringToAnyObjectDictionary], list.count > 0 {
                    for item in list {
                        let city = City(cityDict: item)
                        self.cities.append(city)
                    }
                    self.cities.remove(at:0)
                    self.citiesTableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell else {
            fatalError("Could not dequeue cell with identifier: cityCell")
        }
        let city = cities[indexPath.row]
        cell.configureCityCell(city: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let cell = tableView.cellForRow(at: indexPath) as! CityCell
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.name = cell.cityName.text
        detailsViewController.weatherImg = cell.weatherIconImgView.image
        detailsViewController.weatherType = cell.weatherType.text
        detailsViewController.temperature = cell.maxTemp.text
        detailsViewController.weatherDescription = cell.descr
        detailsViewController.wind = cell.wind
        detailsViewController.clouds = cell.clouds
        tableView.deselectRow(at: indexPath, animated: true)
        self.present(detailsViewController, animated: true , completion: nil)
    }
}
