//
//  ViewController.swift
//  thirteen
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 wangjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var city:City!
    
    
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cityName.text = city.cityName
        let url = URL(string: "http://t.weather.sojson.com/api/weather/city/\(city.cityCode)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:String]] {
            DispatchQueue.main.async {
                print(json)
                
            }
            }
            
        }
    }


}

