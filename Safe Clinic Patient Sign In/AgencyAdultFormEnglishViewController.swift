//
//  AgencyAdultFormEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//
import UIKit
import Firebase

class AgencyAdultFormEnglishViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    var dict: [String: String] = [:]
    @IBOutlet weak var SubmitButton: RoundButton!
    
    @IBOutlet weak var signatureView: SignatureView!
    
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
            let textField = UITextField(frame: CGRect(x: 290.0, y:105.0, width: 100.0, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 170.0, y:105.0, width: 100.0, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 420.0, y:105.0, width: 100.0, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 170.0, y:150.0, width: 100.0, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 290.0, y:150.0, width: 100.0, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 415.0, y:150.0, width: 100.0, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 540.0, y:150.0, width: 30.0, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 630.0, y:150.0, width: 100.0, height: 30.0))
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
        
        let streetAddressField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 145, y:250, width: 130, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Street Address"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        streetAddressField.delegate = self
        scrollView.addSubview(streetAddressField)
        scrollView.bringSubviewToFront(streetAddressField)
        
        let cityField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 310, y:240, width: 60, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 440, y:240, width: 40, height: 30.0))
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
            let textField = UITextField(frame: CGRect(x: 525, y:240, width: 50, height: 20))
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
        
        let socialField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 660, y:240, width: 100, height: 30.0))
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
        socialField.delegate = self
        scrollView.addSubview(socialField)
        scrollView.bringSubviewToFront(socialField)
        
        let residenceField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 40, y:282, width: 150, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Country of Residence"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        residenceField.delegate = self
        scrollView.addSubview(residenceField)
        scrollView.bringSubviewToFront(residenceField)
        
        let cellPhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 580, y:282, width: 130, height: 20))
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
        
        let occupationField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 40, y:315, width: 130, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Occupation"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        occupationField.delegate = self
        scrollView.addSubview(occupationField)
        scrollView.bringSubviewToFront(occupationField)
        
        let employerField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 220, y:315, width: 300, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Employer"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        employerField.delegate = self
        scrollView.addSubview(employerField)
        scrollView.bringSubviewToFront(employerField)
        
        let empPhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 580, y:315, width: 130, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Employer"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        empPhoneField.delegate = self
        scrollView.addSubview(empPhoneField)
        scrollView.bringSubviewToFront(empPhoneField)
        
        let emailField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 390, y:340, width: 300, height: 20))
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
        
        let otherInsuranceField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 65, y:390, width: 100, height: 20))
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
        otherInsuranceField.delegate = self
        scrollView.addSubview(otherInsuranceField)
        scrollView.bringSubviewToFront(otherInsuranceField)
        
        let primaryMemberIDField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 145, y:410, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Primary Member ID"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        primaryMemberIDField.delegate = self
        scrollView.addSubview(primaryMemberIDField)
        scrollView.bringSubviewToFront(primaryMemberIDField)
        
        let primaryMemberField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 135, y:435, width: 180, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Primary Member Name"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        primaryMemberField.delegate = self
        scrollView.addSubview(primaryMemberField)
        scrollView.bringSubviewToFront(primaryMemberField)
        
        let primaryMemberSSNField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 405, y:435, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Primary Member SSN"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        primaryMemberSSNField.delegate = self
        scrollView.addSubview(primaryMemberSSNField)
        scrollView.bringSubviewToFront(primaryMemberSSNField)
        
        let primaryMemberDOBField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 600, y:435, width: 120, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Primary Member DOB"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        primaryMemberDOBField.delegate = self
        scrollView.addSubview(primaryMemberDOBField)
        scrollView.bringSubviewToFront(primaryMemberDOBField)
        
        let secondaryIDField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 215, y:505, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Secondary Insurance Member ID"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        secondaryIDField.delegate = self
        scrollView.addSubview(secondaryIDField)
        scrollView.bringSubviewToFront(secondaryIDField)
        
        let houseMembersField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 245, y:602, width: 130, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Household Members"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        houseMembersField.delegate = self
        scrollView.addSubview(houseMembersField)
        scrollView.bringSubviewToFront(houseMembersField)
        
        let otherReferralField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 573, y:636, width: 130, height: 20))
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
        otherReferralField.delegate = self
        scrollView.addSubview(otherReferralField)
        scrollView.bringSubviewToFront(otherReferralField)
        
        let emergencyNameField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 72, y:715, width: 280, height: 20))
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
        emergencyNameField.delegate = self
        scrollView.addSubview(emergencyNameField)
        scrollView.bringSubviewToFront(emergencyNameField)
        
        let emergRelationField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 360, y:715, width: 140, height: 20))
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
        emergRelationField.delegate = self
        scrollView.addSubview(emergRelationField)
        scrollView.bringSubviewToFront(emergRelationField)
        
        let phoneHomeField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 510, y:715, width: 110, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Emergency Contact Home Phone"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        phoneHomeField.delegate = self
        scrollView.addSubview(phoneHomeField)
        scrollView.bringSubviewToFront(phoneHomeField)
        
        let phoneCellField:UITextField = {
             let textField = UITextField(frame: CGRect(x: 625, y:715, width: 110, height: 20))
             textField.translatesAutoresizingMaskIntoConstraints = false
             textField.placeholder = "Emergency Contact Cell Phone"
             textField.keyboardType = UIKeyboardType.default
             textField.returnKeyType = UIReturnKeyType.done
             textField.autocorrectionType = UITextAutocorrectionType.no
             textField.font = UIFont.systemFont(ofSize: 13)
             textField.borderStyle = UITextField.BorderStyle.roundedRect
             textField.clearButtonMode = UITextField.ViewMode.whileEditing;
             textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
             return textField
         }()
         phoneCellField.delegate = self
         scrollView.addSubview(phoneCellField)
         scrollView.bringSubviewToFront(phoneCellField)
        
        
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
    @IBAction func onSubmit(_ sender: Any) {
        
        
    }
    
//    func {
//    ref = Database.database().reference()
//    self.ref.child("AgencyPatientsAdult").childByAutoId().setValue(["Preferred Name": Preferred_Name,
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
//                                                                 "Relationship Status": Relationship_Status,
//                                                                 "Race" : Race,
//                                                                 "Ethnicity" : Ethnicity,
//                                                                 "Street Address": Street_Address,
//                                                                 "City": City,
//                                                                 "State": State,
//                                                                 "Zip": Zip,
//                                                                 "SSN": SSN,
//                                                                 "County": County,
//                                                                 "Davidson": Davidson,
//                                                                 "Cell": Cell,
//                                                                 "Occupation": Occupation,
//                                                                 "Employer": Employer,
//                                                                 "Employer Phone": Employer_Phone,
//                                                                 "Preferred Contact": Preferred_Contact,
//                                                                 "Email": Email,
//                                                                 "Primary Insurance": Primary_Insurance,
//                                                                 "Primary Member ID": Primary_Member_ID,
//                                                                 "Primary Member Name": Primary_Member_Name,
//                                                                 "Primary Member SSN": Primary_Member_SSN,
//                                                                 "Primary Member DOB": Primary_Member_DOB,
//                                                                 "Secondary Insurance": Secondary_Insurance,
//                                                                 "Secondary Member ID": Secondary_Member_ID,
//                                                                 "Primary Care Physician": Primary_Care_Physician,
//                                                                 "Physician Contact": Physician_Contact,
//                                                                 "Household Income": Household_Income,
//                                                                 "Number in Household": Number_in_Household,
//                                                                 "Heard About": Heard_About,
//                                                                 "Emergency Name": Emergency_Name,
//                                                                 "Emergency Relationship": Emergency_Relationship,
//                                                                 "Emergency Home Phone": Emergency_Home_Phone,
//                                                                 "Emergency Cell Phone": Emergency_Cell_Phone,
//                                                                 "Date": Date])
//    }
  

}
