//
//  AgencyFormTwoPageTwoSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/11/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormTwoPageTwoSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureViewOne: SignatureView!
    @IBOutlet weak var signatureViewTwo: SignatureView!
    
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
            scrollView.addSubview(signatureViewOne)
            scrollView.addSubview(signatureViewTwo)
            scrollView.bringSubviewToFront(imageView)
            scrollView.bringSubviewToFront(signatureViewOne)
            scrollView.bringSubviewToFront(signatureViewTwo)
        
            let nameField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 323.0, y:689.0, width: 180.0, height: 30.0))
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
        
            let parentNameField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 288.0, y:788.0, width: 180.0, height: 30.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Parent Name"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            parentNameField.delegate = self
            scrollView.addSubview(parentNameField)
            scrollView.bringSubviewToFront(parentNameField)
        
            let dateField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 533.0, y:689.0, width: 111.0, height: 30.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Date"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            dateField.delegate = self
            scrollView.addSubview(dateField)
            scrollView.bringSubviewToFront(dateField)
        
            let relationshipField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 456.0, y:781.0, width: 112.0, height: 30.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Relationship"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            relationshipField.delegate = self
            scrollView.addSubview(relationshipField)
            scrollView.bringSubviewToFront(relationshipField)
        
            let dateTwoField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 583.0, y:781.0, width: 84.0, height: 30.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Date"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            dateTwoField.delegate = self
            scrollView.addSubview(dateTwoField)
            scrollView.bringSubviewToFront(dateTwoField)

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
