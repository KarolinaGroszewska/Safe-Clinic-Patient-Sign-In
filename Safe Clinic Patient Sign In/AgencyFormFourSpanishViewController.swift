//
//  AgencyFormFourSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormFourSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
               scrollView.minimumZoomScale = 1
               scrollView.maximumZoomScale = 3
               scrollView.bounces=false
               self.view.addSubview(scrollView)

               imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
               imageView.contentMode = .scaleToFill
               scrollView.addSubview(imageView)
        
            let nameField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 209.0, y:64.0, width: 248.0, height: 30.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Name"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            nameField.delegate = self
            scrollView.addSubview(nameField)
            scrollView.bringSubviewToFront(nameField)
        
            let dobField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 579.0, y:64.0, width: 83.0, height: 30.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Date of Birth"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            dobField.delegate = self
            scrollView.addSubview(dobField)
            scrollView.bringSubviewToFront(dobField)

           }
           
           func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
           {
                return imageView
           }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
       return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
