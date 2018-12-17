//
//  ViewController.swift
//  task11-2
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 hahaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //MARK: UITextFieldDelegate
    //MARK: UIImagePickerControllerDelegate
    @IBOutlet weak var namedTextField: UITextField!

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoimageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        namedTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard.
        textField.resignFirstResponder() //退出文本字段的first-responder状态
        return true
    }
    //这个方法是在系统调用textFieldShouldReturnt后会调用这个方法
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        namedTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,animated: true,completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoimageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}

