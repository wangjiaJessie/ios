//
//  ViewController.swift
//  ScrollView
//
//  Created by Marryjia on 2018/11/24.
//  Copyright © 2018年 Marryjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

  
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5{
            let imageView = UIImageView(image:UIImage(named:"\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1)*scrollview.bounds.width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
            scrollview.addSubview(imageView)
            scrollview.isPagingEnabled = true
        }
        scrollview.contentSize = CGSize(width: 7*scrollview.bounds.width, height: scrollview.bounds.height)
//        scrollview.minimumZoomScale = 0.2
//        scrollview.maximumZoomScale = 5
        scrollview.delegate = self
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return scrollview.subviews.first
//    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int (scrollView.contentOffset.x / scrollView.bounds.width)
    }
    @IBAction func pageControlCliked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage)*scrollview.bounds.width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
        scrollview.scrollRectToVisible(rect, animated: true)
    }
}

