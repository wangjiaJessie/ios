//
//  ViewController.swift
//  task8
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 hahaha. All rights reserved.
//

import UIKit
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var inforTable:UITableView!
    var teacherList = [Teacher]()
    var studentList = [Student]()
    var showTitle = ["Teacher","Student"]
    var rightItem:UIBarButtonItem!
    var leftItem:UIBarButtonItem!
    var alert:UIAlertController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Information List"
        for i in 1...3{
            let student = Student(stuNo: 2016110301 + i, firstName: "tu", lastName: "\(i)", age: 18, gender: Gender.female, department: Department.one)
                studentList.append(student)
        }
        for i in 1...6{
            let teacher = Teacher(title: "老师", firstName: "高", lastName: "\(i)", age: 45, gender: Gender.male, department: Department.three)
            teacherList.append(teacher)
        }
        //对老师按照fullName排序
        teacherList.sort{(t1,t2)->Bool in
            return t1.fullName < t2.fullName
        }
        //对学生按照fullName排序
        studentList.sort{(t1,t2)->Bool in
            return t1.fullName < t2.fullName
        }
        rightItem = UIBarButtonItem(title: "编辑", style: .plain, target: self, action: #selector(edit))
        self.navigationItem.rightBarButtonItem = rightItem
        leftItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addStudent))
        self.navigationItem.leftBarButtonItem = leftItem
        inforTable = UITableView(frame: self.view.bounds)
        inforTable.delegate = self
        inforTable.dataSource = self
        self.view.addSubview(inforTable)
    }
    @objc func edit() {
        if inforTable.isEditing {
            rightItem.title = "编辑"
            inforTable.isEditing = false
        } else {
            rightItem.title = "完成"
            inforTable.isEditing = true
        }
    }
    //添加学生
    @objc func addStudent() {
        alert = UIAlertController(title: "You can add a student", message: "Input the student's message", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "student number"
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = "first name"
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = "last name"
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = "age"
            
        }
        alert.addTextField { (textField) in
            textField.placeholder = "male/female for Gender"
            
        }
        let addButton = UIAlertAction(title: "add", style: .default) { (UIAlertAction) in
            self.add()
        }
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    func add() {
        let no = Int(alert.textFields![0].text!)
        let firstName = alert.textFields![1].text!
        let lastName = alert.textFields![2].text!
        let gender: Gender
        print(alert.textFields!)
        switch alert.textFields![3].text! {
        case "male":
            gender = .male
        case "female":
            gender = .female
        default:
            gender = .unknow
        }
        let age = Int(alert.textFields![4].text!)
        let student = Student(stuNo: no!, firstName: firstName, lastName: lastName, age: age!, gender: gender)
        studentList.append(student)
        inforTable.reloadData()
    }
    // 指明每个section中的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return teacherList.count
        } else {
            return studentList.count
        }
    }
    // 创建cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = showTitle[indexPath.section]
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            let style : UITableViewCell.CellStyle = (identifier == "Teacher") ? .subtitle : .default
            cell = UITableViewCell.init(style: style, reuseIdentifier: identifier)
        }
        switch identifier {
        case "Teacher":
            cell?.textLabel?.text = teacherList[indexPath.row].fullName
            cell?.detailTextLabel?.text = teacherList[indexPath.row].description
            cell?.accessoryType = .disclosureIndicator // 为每个cell添加 > 图标
        case "Student":
            cell?.textLabel?.text = studentList[indexPath.row].fullName
        default:
            break
        }
        return cell!
    }
    // 修改每个section的头
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return showTitle[section]
    }
    // 指明section的个数
    func numberOfSections(in tableView: UITableView) -> Int {
        return showTitle.count
    }
    // 实现删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if indexPath.section == 0 {
                teacherList.remove(at: indexPath.row)
            } else {
                studentList.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    // 实现移动
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath.section != destinationIndexPath.section {
            tableView.reloadData()
        } else {
            if sourceIndexPath.section == 0 {
                teacherList.insert(teacherList.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            } else {
                studentList.insert(studentList.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            }
        }
    }
    // 实现显示选择
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectTch: Teacher!
        let selectStu: Student!
        let alert: UIAlertController!
        
        if indexPath.section == 0 {
            selectTch = teacherList[indexPath.row]
            alert = UIAlertController(title: "More Information", message: selectTch.description, preferredStyle: .alert)
        } else {
            selectStu = studentList[indexPath.row]
            alert = UIAlertController(title: "More Information", message: selectStu.description, preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

