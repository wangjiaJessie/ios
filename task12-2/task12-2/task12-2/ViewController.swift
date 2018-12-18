//
//  ViewController.swift
//  task12-2
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 hahaha. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    //拿到应用代理
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //拿到上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.name = tfName.text
        person.phone = tfPhone.text
        
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch: NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)  //相当于where语句
        let person = try? context.fetch(fetch)
        if let p = person?.first{
             p.phone = tfPhone.text
            
        }
    }
    @IBAction func del(_ sender: Any) {
        let fetch: NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)  //相当于where语句
        let person = try? context.fetch(fetch)
        if let p = person?.first{
            context.delete(p)
           
        }
    }
//    @IBAction func query(_ sender: Any) {
//        let fetch: NSFetchRequest<Person> = Person.fetchRequest()
//        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)  //相当于where语句
//        let person = try? context.fetch(fetch)
//        if let p = person?.first{
//            tfPhone.text = p.phone
//        }
//    }
}

