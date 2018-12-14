//
//  MyUIView.swift
//  forthtask2
//
//  Created by Marryjia on 2018/12/14.
//  Copyright © 2018年 wj. All rights reserved.
//

import UIKit

class MyView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        
        UIColor.blue.setStroke()
        path.stroke()
        
        UIColor.brown.setFill()
        path.fill()
        
    }
}

