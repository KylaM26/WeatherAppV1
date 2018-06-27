//
//  ViewController.swift
//  RainyCloudlyShinyV1
//
//  Created by Kyla Wilson on 6/27/18.
//  Copyright © 2018 Kyla. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var weatherTabel: UITableView!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var weatherDescription: UILabel!
    
    var weather: WeatherData! = nil;

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTabel.delegate = self;
        weatherTabel.dataSource = self;
        
        weather = WeatherData();
        
        if weather != nil{
            weather.DownloadWeatherDetails {
                self.UpdateMainUI();
            }
        }
    }

    func UpdateMainUI() {
        self.dateLbl.text = weather.date;
        self.temperatureLbl.text = "\(weather.currentTemp)°";
        self.locationLbl.text = weather.cityName;
        self.weatherDescription.text = weather.weatherType;
        self.weatherImg.image = UIImage(named: weather.weatherType);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = weatherTabel.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? UITableViewCell {
            return cell;
        }
        
        return UITableViewCell();
    }
    
    
}

