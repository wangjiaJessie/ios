//
//  CityTableViewController.swift
//  thirteen
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 wangjia. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    var citys = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let city1 = City(cityName: "北京", cityCode: "101270101")
        let city2 = City(cityName: "上海", cityCode: "101010100")
        let city3 = City(cityName: "南京", cityCode: "101020100")
        let city4 = City(cityName: "重庆", cityCode: "101040100")
        let city5 = City(cityName: "哈尔滨", cityCode: "101050101")
        let city6 = City(cityName: "江苏", cityCode: "101110101")
        let city7 = City(cityName: "西藏", cityCode: "101140101")
        
        citys.append(city1)
        citys.append(city2)
        citys.append(city3)
        citys.append(city4)
        citys.append(city5)
        citys.append(city6)
        citys.append(city7)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citys.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = citys[indexPath.row].cityName
        // Configure the cell...

        return cell
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail" {
            let secVC = segue.destination as! ViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            secVC.city = citys[indexPath?.row ?? 0]
        }
    }

}
