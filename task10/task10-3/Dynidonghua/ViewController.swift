//
//  ViewController.swift
//  Dynidonghua
//
//  Created by Marryjia on 2018/11/27.
//  Copyright © 2018年 Marryjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var animator = UIDynamicAnimator(referenceView:self.backview)
    let grivaty = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    
    @IBOutlet weak var backview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(grivaty)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addview(_ sender: Any) {
        let width = Int(backview.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x: randx, y: 0, width: width, height: width))
        label.text = "A"
        label.backgroundColor = UIColor.red
        label.textAlignment = .center
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowOpacity = 1
        backview.addSubview(label)
        
        grivaty.addItem(label)
        collision.addItem(label)
    }
    
    @IBAction func deleteall(_ sender: Any) {
        for item in self.backview.subviews{
            if item is UILabel{
                item.removeFromSuperview()
                grivaty.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
    @IBAction func up(_ sender: Any) {
        grivaty.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func down(_ sender: Any) {
         grivaty.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func left(_ sender: Any) {
         grivaty.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func right(_ sender: Any) {
         grivaty.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
}

