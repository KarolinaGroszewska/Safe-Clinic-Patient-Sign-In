//
//  AgencyFormThreePageTwoSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/11/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormThreePageTwoSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollViews: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureViewOne: SignatureView!
    @IBOutlet weak var signatureViewTwo: SignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViews.frame = CGRect(x: 0, y: 0, width: scrollViews.frame.width, height: scrollViews.frame.height)
                   scrollViews.minimumZoomScale = 1
                   scrollViews.maximumZoomScale = 3
                   scrollViews.bounces=false
                   self.view.addSubview(scrollViews)

                   imageView.frame = CGRect(x: 0, y: 0, width: scrollViews.frame.width, height: scrollViews.frame.height)
                   imageView.contentMode = .scaleToFill
                   scrollViews.addSubview(imageView)
                   scrollViews.addSubview(signatureViewOne)
                   scrollViews.addSubview(signatureViewTwo)
                   scrollViews.bringSubviewToFront(imageView)
                   scrollViews.bringSubviewToFront(signatureViewOne)
                   scrollViews.bringSubviewToFront(signatureViewTwo)
        
                    let nameField:UITextField = {
                        let textField = UITextField(frame: CGRect(x: 319.0, y:690.0, width: 187.0, height: 30.0))
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
                    scrollViews.addSubview(nameField)
                    scrollViews.bringSubviewToFront(nameField)
        
                    let dateField:UITextField = {
                        let textField = UITextField(frame: CGRect(x: 526.0, y:690.0, width: 112.0, height: 30.0))
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
                    scrollViews.addSubview(dateField)
                    scrollViews.bringSubviewToFront(dateField)
        
                    let parentNameField:UITextField = {
                        let textField = UITextField(frame: CGRect(x: 274.0, y:783.0, width: 170.0, height: 30.0))
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
                    scrollViews.addSubview(parentNameField)
                    scrollViews.bringSubviewToFront(parentNameField)
        
        
                    let relationshipField:UITextField = {
                            let textField = UITextField(frame: CGRect(x: 445.0, y:783.0, width: 126.0, height: 30.0))
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
                        scrollViews.addSubview(relationshipField)
                        scrollViews.bringSubviewToFront(relationshipField)
                    
                        let dateTwoField:UITextField = {
                            let textField = UITextField(frame: CGRect(x: 574.0, y:783.0, width: 86.0, height: 30.0))
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
                        scrollViews.addSubview(dateTwoField)
                        scrollViews.bringSubviewToFront(dateTwoField)
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
