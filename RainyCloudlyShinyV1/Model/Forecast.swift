//
//  Forecast.swift
//  RainyCloudlyShinyV1
//
//  Created by Kyla Wilson on 6/28/18.
//  Copyright © 2018 Kyla. All rights reserved.
//

import UIKit
import Alamofire

extension Date {
    func DayOfTheWeek() -> String {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEEE"; // Means a name of the day of the week.
        return dateFormatter.string(from: self);
    }
}

class Forecast {
    private(set) private var _date: String!
    private(set) private var _weatherType: String!
    private(set) private var _highTemp: String!
    private(set) private var _lowTemp: String!
    
    init(weatherDict: Dictionary<String, Any>) {
        if let main = weatherDict["main"] as? Dictionary<String, Any> {
            if let min = main["temp_min"] as? Double {
                let minFarienheit = KelvinToFarenheit(temp: min);
                self._lowTemp = "\(minFarienheit)";
            }
            
            if let max = main["temp_max"] as? Double {
                let maxFarienheit = KelvinToFarenheit(temp: max);
                self._highTemp = "\(maxFarienheit)";
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, Any>] {
            if let type = weather[0]["main"] as? String {
                self._weatherType = type;
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixDate = Date(timeIntervalSince1970: date);
            let formatter = DateFormatter();
            formatter.dateStyle = .full;
            formatter.timeStyle = .none;
            formatter.dateFormat = "EEEE";
            self._date = unixDate.DayOfTheWeek();
        }
    }
    
    func KelvinToFarenheit(temp: Double) -> Double {
        let kelvinToFarenheitPredivision = (temp * (9 / 5) - 459.67);
        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPredivision / 10));
        return kelvinToFarenheit;
    }
    
    var date: String {
        if _date == nil {
            _date = "";
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = "";
        }
        return _weatherType;
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = "";
        }
        
        return _highTemp;
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = "";
        }
        return _lowTemp;
    }
    
}














