//
//  AgencyChildFormSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Firebase

class AgencyChildFormSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
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

               imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
               imageView.contentMode = .scaleToFill
               scrollView.addSubview(imageView)
        
            let firstField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 375.0, y:100.0, width: 100.0, height: 20.0))
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
                let textField = UITextField(frame: CGRect(x: 120.0, y:100.0, width: 100.0, height: 20.0))
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
                let textField = UITextField(frame: CGRect(x: 610.0, y:100.0, width: 100.0, height: 20.0))
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
                let textField = UITextField(frame: CGRect(x: 50.0, y:135.0, width: 100.0, height: 30.0))
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
                let textField = UITextField(frame: CGRect(x: 185.0, y:135.0, width: 100.0, height: 30.0))
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
                let textField = UITextField(frame: CGRect(x: 370.0, y:135.0, width: 100.0, height: 30.0))
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
                let textField = UITextField(frame: CGRect(x: 540.0, y:138.0, width: 30.0, height: 30.0))
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
                let textField = UITextField(frame: CGRect(x: 630.0, y:138.0, width: 100.0, height: 30.0))
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

           }
           
           func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
           {
                return imageView
           }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
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
