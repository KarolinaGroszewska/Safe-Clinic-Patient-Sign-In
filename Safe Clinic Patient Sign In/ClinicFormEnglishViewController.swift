//
//  ClinicFormEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Firebase
import MessageUI

class ClinicFormEnglishViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var SubmitButton: UIButton!
    @IBOutlet weak var signatureView: UIView!
    
    var ref: DatabaseReference!
    var dict: [String: String] = [:]

    
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
    scrollView.addSubview(signatureView)
    scrollView.bringSubviewToFront(imageView)
    scrollView.bringSubviewToFront(signatureView)
        
    let firstField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 170.0, y:190.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "First Name"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    firstField.delegate = self
    scrollView.addSubview(firstField)
    scrollView.bringSubviewToFront(firstField)
        
    let dateField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 120.0, y:140.0, width: 100.0, height: 30.0))
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
    dateField.delegate =  self
    scrollView.addSubview(dateField)
    scrollView.bringSubviewToFront(dateField)
        
    let lastField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 360.0, y:190.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Last Name"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
        lastField.delegate = self
    scrollView.addSubview(lastField)
    scrollView.bringSubviewToFront(lastField)
        
    let genderField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 135.0, y:255.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Gender"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    genderField.delegate = self
    scrollView.addSubview(genderField)
    scrollView.bringSubviewToFront(genderField)
        
    let pronounField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 410.0, y:255.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Pronouns"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    pronounField.delegate = self
    scrollView.addSubview(pronounField)
    scrollView.bringSubviewToFront(pronounField)
        
    let addressField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 195.0, y:303.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Address"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    addressField.delegate = self
    scrollView.addSubview(addressField)
    scrollView.bringSubviewToFront(addressField)
        
    let cityField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 370.0, y:303.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "City"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    cityField.delegate = self
    scrollView.addSubview(cityField)
    scrollView.bringSubviewToFront(cityField)
        
    let stateField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 480.0, y:303.0, width: 60.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "State"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    stateField.delegate = self
    scrollView.addSubview(stateField)
    scrollView.bringSubviewToFront(stateField)
        
    let zipField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 540.0, y:303.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Zip"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    zipField.delegate = self
    scrollView.addSubview(zipField)
    scrollView.bringSubviewToFront(zipField)
        
    let phoneField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 210.0, y:370.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Phone"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    phoneField.delegate = self
    scrollView.addSubview(phoneField)
    scrollView.bringSubviewToFront(phoneField)
        
    let birthField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 175.0, y:415.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Birthday"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    birthField.delegate = self
    scrollView.addSubview(birthField)
    scrollView.bringSubviewToFront(birthField)
        
    let ageField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 400.0, y:415.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Age"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    ageField.delegate = self
    scrollView.addSubview(ageField)
    scrollView.bringSubviewToFront(ageField)
        
    let raceField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 190.0, y:450.0, width: 100.0, height: 25.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Race"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    raceField.delegate = self
    scrollView.addSubview(raceField)
    scrollView.bringSubviewToFront(raceField)
        
    let ssnField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 240.0, y:480.0, width: 100.0, height: 25.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "SSN"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    ssnField.delegate = self
    scrollView.addSubview(ssnField)
    scrollView.bringSubviewToFront(ssnField)
        
    let assaultDateField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 200.0, y:510.0, width: 100.0, height: 25.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Assault Date"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    assaultDateField.delegate = self
    scrollView.addSubview(assaultDateField)
    scrollView.bringSubviewToFront(assaultDateField)
        
    let locationField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 325.0, y:540.0, width: 100.0, height: 25.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Assault Location"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    locationField.delegate = self
    scrollView.addSubview(locationField)
    scrollView.bringSubviewToFront(locationField)
        
        
    let emergencyContactField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 205.0, y:670.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Emergency Contact"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    emergencyContactField.delegate = self
    scrollView.addSubview(emergencyContactField)
    scrollView.bringSubviewToFront(emergencyContactField)
        
    let emergencyPhoneField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 300.0, y:700.0, width: 100.0, height: 30.0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Emergency Phone"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    emergencyPhoneField.delegate = self
    scrollView.addSubview(emergencyPhoneField)
    scrollView.bringSubviewToFront(emergencyPhoneField)

    
        
        
        
          }

//        func sendEmail() {
//            if MFMailComposeViewController.canSendMail() {
//                let mail = MFMailComposeViewController()
//                mail.mailComposeDelegate = self
//                mail.setToRecipients(["smsliman@aol.com"])
//                mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
//
//                present(mail, animated: true)
//                print("not an error")
//            } else {
//                print("error")
//                // show failure alert
//            }
//        }
//
//        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//            controller.dismiss(animated: true)
//        }
//        sendEmail()
         
    

               func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
              {
                   return imageView
              }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dict[textField.placeholder ?? ""] = textField.text ?? ""
       textField.resignFirstResponder()
        print(dict)
       return true
    }
     func textFieldDidChangeSelection(_ textField: UITextField) {
        dict[textField.placeholder ?? ""] = textField.text ?? ""
    }

    @IBAction func onSubmit(_ sender: Any) {

       
               ref = Database.database().reference()
               self.ref.child("ClinicPatients").childByAutoId().setValue(["Date": dict["Date"],
                                                                    "FirstName": dict["First Name"],
                                                                    "Last Name": dict ["Last Name"],
                                                                    "Gender":dict["Gender"],
                                                                    "Preferred Pronouns": dict["Pronouns"],
                                                                    "Street Adress": dict["Address"],
                                                                    "City":dict["City"],
                                                                    "State":dict["State"],
                                                                    "Zip":dict["Zip"],
                                                                    "Phone":dict["Phone"],
                                                                    "Birthday":dict["Birthday"],
                                                                    "Age":dict["Age"],
                                                                    "Race or Ethnicity":dict["Race"],
                                                                    "SSN":dict["SSN"],
                                                                    "Assault Date": dict["Assault Date"],
                                                                    "Assault City and State": dict["Assault Location"],
                                                                    "Emergency Contact" : dict["Emergency Contact"],
                                                                    "Emergency Phone" : dict["Emergency Phone"]])
    }

}
