//
//  ViewController.swift
//  task11-1
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 mmy. All rights reserved.
//

import UIKit
protocol StudentProtocol {
    func change(name:String ,no:String)
}

class FirstViewController: UIViewController,StudentProtocol {
    func change(name: String, no: String) {
        self.name = name
        self.no = no
    }
    

    var name = ""
    var no = ""
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        tfNo.text = no
        tfName.text = name
    }
    @IBAction func showSecondVC(_ sender: Any) {
        no = tfNo.text!
        name = tfName.text!
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecVC") as!SecondViewController
        secVC.no = tfNo.text!
        secVC.name = tfName.text!
        secVC.delegate = self
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    @IBAction func showThirdVC(_ sender: Any) {
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        present(secVC,animated: true,completion: nil)
    }
}

