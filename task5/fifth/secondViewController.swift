//
//  secondViewController.swift
//  fifth
//
//  Created by Marryjia on 2018/11/19.
//  Copyright © 2018年 Marryjia. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 350, height: 400))
        imageView.image = UIImage(named:"1")
        view.addSubview(imageView)
    }
}
