//
//  CurrentWeather.swift
//  RainyCloudlyShinyV1
//
//  Created by Kyla Wilson on 6/27/18.
//  Copyright © 2018 Kyla. All rights reserved.
//

import UIKit
import Alamofire

class WeatherData {
    
    static let instance = WeatherData();
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = "";
        }
        return _cityName;
    }
    
    var date: String {
        if _date == nil {
            _date = "";
        }
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateStyle = DateFormatter.Style.long;
        dateFormatter.timeStyle = DateFormatter.Style.none;
        let currentDate = dateFormatter.string(from: Date()); // Create a string of the current date!
        self._date = "Today, \(currentDate)";
        
        return _date;
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = "";
        }
        return _weatherType;
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0;
        }
        return _currentTemp
    }
    
    func DownloadWeatherDetails(completed: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!;
        Alamofire.request(currentWeatherURL).responseJSON { (response) in // Is getting the JSON data.
            let result = response.result;
            print(result);
        }
        completed();
    }
}

























