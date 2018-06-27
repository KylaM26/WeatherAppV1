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

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTabel.delegate = self;
        weatherTabel.dataSource = self;
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

