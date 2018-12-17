//
//  ViewController.swift
//  task6-2
//
//  Created by Marryjia on 2018/12/16.
//  Copyright © 2018年 wj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let blackView = UIView()
        blackView.backgroundColor = UIColor.black
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        let grayView = UIView()
        grayView.backgroundColor = UIColor.gray
        
        let stackView = UIStackView(arrangedSubviews: [blackView,blueView,grayView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.backgroundColor = UIColor.brown
        
        view.addSubview(stackView)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false //自动调整关闭
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true//右和下以负数进行调整
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

