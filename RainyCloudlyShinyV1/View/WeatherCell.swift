//
//  WeatherCell.swift
//  RainyCloudlyShinyV1
//
//  Created by Kyla Wilson on 6/27/18.
//  Copyright © 2018 Kyla. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    
    func UpdateCell(forecast: Forecast) {
        descriptionImage.image = UIImage(named: forecast.weatherType);
        lowTempLbl.text = forecast.lowTemp;
        highTempLbl.text = forecast.highTemp;
        weatherTypeLbl.text = forecast.weatherType;
    }
}
