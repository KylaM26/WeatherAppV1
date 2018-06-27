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
            _cityName = "NA";
        }
        return _cityName;
    }
    
    var date: String {
        if _date == nil {
            _date = "NA";
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
            _weatherType = "NA";
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
            
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized;
                }
                
                // URL -> http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=fc90c86d2bf24271bd1fd41295ac1a82
                
                if let type = dict["weather"] as? [Dictionary<String, Any>] { // For nested JSON data
                    if let main = type[0]["main"] as? String { // 0 is for first array, and inside the first arry, find the key titled main.
                        self._weatherType = main.capitalized;
                    }
                }
                
                if let weather = dict["main"] as? Dictionary<String, Any> {
                    if let temp = weather["temp"] as? Double {
                        let kelvinToFarenheitPredivision = (temp * (9 / 5) - 459.67);
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPredivision / 10));
                        self._currentTemp = kelvinToFarenheit;
                    }
                }
            }
            completed();
        }
    }
}

























