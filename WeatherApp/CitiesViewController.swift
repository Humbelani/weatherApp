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
    var city: City!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadCities{}
    }

    func downloadCities(completed: @escaping DownloadComplete) {

        let forecastURL = URL(string: Constants.Cities.url)!
        
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? StringToAnyObjectDictionary {
                if let list = dict["list"] as? [StringToAnyObjectDictionary], list.count > 0 {
                    for item in list {
                        self.city = City(cityDict: item)
                        self.cities.append(self.city)
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
        city = cities[indexPath.row]
        cell.configureCityCell(city: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        city = cities[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailsViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsViewController = segue.destination as! DetailsViewController
        detailsViewController.city = city
    }
}
