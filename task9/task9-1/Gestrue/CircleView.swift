//
//  CircleView.swift
//  Gestrue
//
//  Created by Marryjia on 2018/11/24.
//  Copyright © 2018年 Marryjia. All rights reserved.
//

import UIKit

@IBDesignable //使circleView代码绘制的图能在Main.storyboard显示
class CircleView: UIView {

    
  @IBInspectable var fillColor:UIColor?      //设置图形内部的颜色
  @IBInspectable var strokeColor:UIColor?   //设置轮廓的颜色
    func setup(){
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recongnizer:)))
        self.addGestureRecognizer(panRecognizer)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recongnizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recongnizer:)))
        self.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.numberOfTouchesRequired = 1
    }
    @objc func tap(recongnizer:UITapGestureRecognizer){
        switch recongnizer.state {
        case .recognized:
            print("double cliked")          
        default:
            break
        }
    }
    @objc func pinch(recongnizer:UIPinchGestureRecognizer){
        switch recongnizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recongnizer.scale, height: bounds.height * recongnizer.scale)
            recongnizer.scale = 1
        default:
            break
        }
    }
   @objc func pan(recongnizer:UIPanGestureRecognizer){
    switch recongnizer.state {
    case .changed:
        fallthrough
    case .ended:
        let translation = recongnizer.translation(in: self)
        center.x += translation.x
        center.y += translation.y
        recongnizer.setTranslation(.zero, in: self)
    default:
        break
    }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn:rect)
        fillColor?.setFill()
        strokeColor?.setStroke()
        path.fill()
        path.stroke()
    }

    

}
