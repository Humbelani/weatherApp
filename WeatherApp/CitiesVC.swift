//
//  CitiesVC.swift
//  WeatherApp
//
//  Created by Humbelani Mdau on 2017/09/28.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import Alamofire

class CitiesVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var citiesTableView: UITableView!
    
    var cities = [City]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        self.downloadCitiesData{}
    }

    func downloadCitiesData(completed: @escaping DownloadComplete) {

        let forecastURL = URL(string: CITIES_URL)!
        
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let city = City(cityDict: obj)
                        self.cities.append(city)
                        print(obj)
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell {
            let city = cities[indexPath.row]
            cell.configureCityCell(city: city)
            return cell
        } else {
            return CityCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let cell = tableView.cellForRow(at: indexPath) as! CityCell
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsView") as! DetailsVC
        detailsVC.name = cell.cityName.text
        detailsVC.weatherImg = cell.weatherIconImgView.image
        detailsVC.weatherType = cell.weatherType.text
        detailsVC.temperature = cell.maxTemp.text
        detailsVC.weatherDescription = cell.descr
        detailsVC.wind = cell.wind
        detailsVC.clouds = cell.clouds
        tableView.deselectRow(at: indexPath, animated: true)
        self.present(detailsVC, animated: true , completion: nil)
    }
    
}
