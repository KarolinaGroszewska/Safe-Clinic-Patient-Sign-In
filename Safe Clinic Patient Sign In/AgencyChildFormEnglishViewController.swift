//
//  AgencyChildFormEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Firebase

class AgencyChildFormEnglishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!    
    @IBOutlet weak var signatureView: SignatureView!
    @IBOutlet weak var SubmitButton: RoundButton!
    var dict: [String: String] = [:]
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            scrollView.minimumZoomScale = 1
            scrollView.maximumZoomScale = 3
            scrollView.bounces=false
            self.view.addSubview(scrollView)

            image.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            image.contentMode = .scaleToFill
            scrollView.addSubview(image)
            scrollView.addSubview(signatureView)
            scrollView.bringSubviewToFront(image)
            scrollView.bringSubviewToFront(signatureView)
        
            let firstField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 379, y:100, width: 161, height: 20.0))
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

            let lastField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 120.0, y:100.0, width: 160, height: 20.0))
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
            
            let middleField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 590, y:100, width: 140, height: 20.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Middle Name"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            middleField.delegate = self
            scrollView.addSubview(middleField)
            scrollView.bringSubviewToFront(middleField)
            
            let preferredField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 40, y:145, width: 140, height: 20))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Preferred Name"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            preferredField.delegate = self
            scrollView.addSubview(preferredField)
            scrollView.bringSubviewToFront(preferredField)
            
            let formerField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 185.0, y:145, width: 160, height: 20))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Former Name"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            formerField.delegate = self
            scrollView.addSubview(formerField)
            scrollView.bringSubviewToFront(formerField)
            
            let birthdayField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 350, y:145, width: 180, height: 20))
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
            birthdayField.delegate = self
            scrollView.addSubview(birthdayField)
            scrollView.bringSubviewToFront(birthdayField)
            
            let ageField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 530, y:150, width: 35, height: 20))
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
            
            let genderField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 630.0, y:145, width: 110, height: 20))
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
        
        let citizenField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 72, y:235, width: 235, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Citizenship"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        citizenField.delegate = self
        scrollView.addSubview(citizenField)
        scrollView.bringSubviewToFront(citizenField)
        
        let relationField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 310, y:235, width: 220, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Relation"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        relationField.delegate = self
        scrollView.addSubview(relationField)
        scrollView.bringSubviewToFront(relationField)
        
        let phoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 515, y:235, width: 220, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Phone Number"
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
        
        let emailField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 355, y:265, width: 370, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Email Address"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        emailField.delegate = self
        scrollView.addSubview(emailField)
        scrollView.bringSubviewToFront(emailField)
        
        let addressField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 63, y:300, width: 125, height: 20))
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
            let textField = UITextField(frame: CGRect(x: 180, y:300, width: 125, height: 20))
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
            let textField = UITextField(frame: CGRect(x: 317, y:300, width: 75, height: 20))
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
            let textField = UITextField(frame: CGRect(x: 394, y:300, width: 75, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Zip Code"
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
        
        let ssnField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 475, y:300, width: 75, height: 20))
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
        
        let homePhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 570, y:300, width: 161, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Home Phone"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        homePhoneField.delegate = self
        scrollView.addSubview(homePhoneField)
        scrollView.bringSubviewToFront(homePhoneField)
        
        let countyField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 26, y:330, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "County"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        countyField.delegate = self
        scrollView.addSubview(countyField)
        scrollView.bringSubviewToFront(countyField)
        
        let cellPhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 570, y:330, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Cell Phone"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        cellPhoneField.delegate = self
        scrollView.addSubview(cellPhoneField)
        scrollView.bringSubviewToFront(cellPhoneField)
        
        let otherIField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 640, y:355, width: 85, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Other"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        otherIField.delegate = self
        scrollView.addSubview(otherIField)
        scrollView.bringSubviewToFront(otherIField)
        
        let memID:UITextField = {
            let textField = UITextField(frame: CGRect(x: 135, y:380, width: 225, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Member ID"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        memID.delegate = self
        scrollView.addSubview(memID)
        scrollView.bringSubviewToFront(memID)
        
        let memName:UITextField = {
            let textField = UITextField(frame: CGRect(x: 115, y:400, width: 225, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Member Name"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        memName.delegate = self
        scrollView.addSubview(memName)
        scrollView.bringSubviewToFront(memName)
        
        let memSSN:UITextField = {
            let textField = UITextField(frame: CGRect(x: 400, y:400, width: 131, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Member SSN"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        memSSN.delegate = self
        scrollView.addSubview(memSSN)
        scrollView.bringSubviewToFront(memSSN)
        
        let memDOBField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 565, y:400, width: 131, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Member DOB"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        memDOBField.delegate = self
        scrollView.addSubview(memDOBField)
        scrollView.bringSubviewToFront(memDOBField)
        
        let pcpField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 245, y:500, width: 131, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Primary Care Physician"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        pcpField.delegate = self
        scrollView.addSubview(pcpField)
        scrollView.bringSubviewToFront(pcpField)
        
        let otherRefField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 570, y:540, width: 130, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Other"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        otherRefField.delegate = self
        scrollView.addSubview(otherRefField)
        scrollView.bringSubviewToFront(otherRefField)
        
        let schoolField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 233, y:600, width: 155, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "School"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        schoolField.delegate = self
        scrollView.addSubview(schoolField)
        scrollView.bringSubviewToFront(schoolField)
        
        let dccField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 201, y:633, width: 256, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "DCC"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        dccField.delegate = self
        scrollView.addSubview(dccField)
        scrollView.bringSubviewToFront(dccField)
        
        let dccPhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 551, y:635, width: 120, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "DCC Phone"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        dccPhoneField.delegate = self
        scrollView.addSubview(dccPhoneField)
        scrollView.bringSubviewToFront(dccPhoneField)
        
        let eNameField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 68, y:680, width: 270, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Emergency Contact Name"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        eNameField.delegate = self
        scrollView.addSubview(eNameField)
        scrollView.bringSubviewToFront(eNameField)
        
        let eRelationField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 350, y:690, width: 150, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Emergency Contact Relation"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        eRelationField.delegate = self
        scrollView.addSubview(eRelationField)
        scrollView.bringSubviewToFront(eRelationField)
        
        let ePhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 504, y:690, width: 115, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Emergency Contact Phone Number"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        ePhoneField.delegate = self
        scrollView.addSubview(ePhoneField)
        scrollView.bringSubviewToFront(ePhoneField)
        
        let eCellField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 623, y:690, width: 100, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Emergency Contact Cell Number"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        eCellField.delegate = self
        scrollView.addSubview(eCellField)
        scrollView.bringSubviewToFront(eCellField)

        
        
    }

    
        func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
        {
             return image
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
    
    @IBAction func OnSubmit(_ sender: Any) {
        
        ref = Database.database().reference()
        //    self.ref.child("AgencyPatientsChild").childByAutoId().setValue(["Preferred Name": Preferred_Name,
        //                                                                 "First Name": First_Name,
        //                                                                 "Last Name": Last_Name,
        //                                                                 "Middle Name": Middle_Name,
        //                                                                 "Former Name":  Former_Name,
        //                                                                 "Birth Day": Birth_Day,
        //                                                                 "Birth Month": Birth_Month,
        //                                                                 "Birth Year": Birth_Year,
        //                                                                 "Age": Age,
        //                                                                 "Sex": Sex,
        //                                                                 "Gender": Gender,
        //                                                                 "Race" : Race,
        //                                                                 "Ethnicity" : Ethnicity,
        //                                                                 "Preferred Contact Name": Preferred_Contact_Name,
        //                                                                 "Preferred Contact Relationship": Preferred_Contact_Relationship,
        //                                                                 "Preferred Contact Phone": Preferred_Contact_Phone,
        //                                                                 "Preferred Contact Method": Preferred_Contact_Method,
        //                                                                 "Preferred Contact Email": Preferred_Contact_Email,
        //                                                                 "Street Address": Street_Address,
        //                                                                 "City": City,
        //                                                                 "State": State,
        //                                                                 "Zip": Zip,
        //                                                                 "SSN": SSN,
        //                                                                 "County": County,
        //                                                                 "Davidson": Davidson,
        //                                                                 "Cell": Cell,
        //                                                                 "Primary Insurance": Primary_Insurance,
        //                                                                 "Primary Member ID": Primary_Member_ID,
        //                                                                 "Primary Member Name": Primary_Member_Name,
        //                                                                 "Primary Member SSN": Primary_Member_SSN,
        //                                                                 "Primary Member DOB": Primary_Member_DOB,
        //                                                                 "Primary Care Physician": Primary_Care_Physician,
        //                                                                 "Physician Contact": Physician_Contact,
        //                                                                 "Household Income": Household_Income,
        //                                                                 "Number in Household": Number_in_Household,
        //                                                                 "Heard About": Heard_About,
        //                                                                 "School": School,
        //                                                                 "DCS Guardian": DCS_Guardian,
        //                                                                 "DCS Phone": DCS_Phone,
        //                                                                 "Emergency Name": Emergency_Name,
        //                                                                 "Emergency Relationship": Emergency_Relationship,
        //                                                                 "Emergency Home Phone": Emergency_Home_Phone,
        //                                                                 "Emergency Cell Phone": Emergency_Cell_Phone,
        //                                                                 "Date": Date])
    }
}
