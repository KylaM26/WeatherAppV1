//
//  Constants.swift
//  RainyCloudlyShinyV1
//
//  Created by Kyla Wilson on 6/27/18.
//  Copyright © 2018 Kyla. All rights reserved.
//

import Foundation

let BASE_URL: String = "http://api.openweathermap.org/data/2.5/weather?";
let APP_ID: String = "&appid=";
let API_KEY: String = "fc90c86d2bf24271bd1fd41295ac1a82";

// These constants will store the the latitute and longitude of wherever the user is located with this app.
let LATITUDE: String = "lat=";
let LONGITUTDE: String = "lon=";

let CURRENT_WEATHER_URL: String = "\(BASE_URL)\(LATITUDE)-30\(LONGITUTDE)111\(APP_ID)\(API_KEY)";
