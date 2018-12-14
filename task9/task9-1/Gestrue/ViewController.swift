//
//  ViewController.swift
//  Gestrue
//
//  Created by Marryjia on 2018/11/24.
//  Copyright © 2018年 Marryjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addLabel(_ sender: Any) {
        let x = Int(arc4random()) % Int(view.bounds.width)
        let y = Int(arc4random()) % Int(view.bounds.height)
       let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 5
        , height: 5)
        label.layer.shadowOpacity = 1
        view.addSubview(label)
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recongnizer:)))
        label.addGestureRecognizer(panRecognizer)
        label.isUserInteractionEnabled = true
    }
    @objc func pan(recongnizer:UIPanGestureRecognizer){
        switch recongnizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recongnizer.translation(in: self.view)
            recongnizer.view?.center.x += translation.x
            recongnizer.view?.center.y += translation.y
            recongnizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    @IBAction func moveLabel(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel{
                UIView.animate(withDuration: 1, animations: {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                })
            }
        }
    }
    
    @IBAction func deleteLabel(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel{
                label.removeFromSuperview()
            }
        }
    }
}


