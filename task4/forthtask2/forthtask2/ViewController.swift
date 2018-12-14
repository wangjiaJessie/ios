//
//  ViewController.swift
//  forthtask2
//
//  Created by Marryjia on 2018/12/14.
//  Copyright © 2018年 wj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let oval = MyView(frame: CGRect(x: 100, y: 300, width: 50, height: 120))
        oval.backgroundColor = UIColor.clear
        self.view.addSubview(oval)
    }
}

