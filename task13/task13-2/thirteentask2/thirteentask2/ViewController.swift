//
//  ViewController.swift
//  thirteentask2
//
//  Created by Marryjia on 2018/12/14.
//  Copyright © 2018年 wj. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //一运行就会出现百度的界面
        if let url = URL(string: "https://www.baidu.com"){
            webView.loadRequest(URLRequest(url: url))
        }
    }
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: urlTF.text!){
            webView.loadRequest(URLRequest(url: url))
        }
    }
    //退回
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    //前进
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
}

