//
//  AgencyAdultFormSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Firebase

class AgencyAdultFormSpanishViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
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
                let textField = UITextField(frame: CGRect(x: 204, y:130, width: 100, height: 20.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Primer nombre"
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
                let textField = UITextField(frame: CGRect(x: 33, y:130, width: 135, height: 20.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Apellido"
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
                let textField = UITextField(frame: CGRect(x: 320, y:130, width: 100.0, height: 20.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Nombre segundo"
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
        
            let estadoField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 450, y:130, width: 100.0, height: 20.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Estado Civil"
                textField.keyboardType = UIKeyboardType.default
                textField.returnKeyType = UIReturnKeyType.done
                textField.autocorrectionType = UITextAutocorrectionType.no
                textField.font = UIFont.systemFont(ofSize: 13)
                textField.borderStyle = UITextField.BorderStyle.roundedRect
                textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                return textField
            }()
            estadoField.delegate = self
            scrollView.addSubview(estadoField)
            scrollView.bringSubviewToFront(estadoField)
            
            let preferredField:UITextField = {
                let textField = UITextField(frame: CGRect(x: 33, y:170, width: 120, height: 20.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Nombre preferido"
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
                let textField = UITextField(frame: CGRect(x: 320, y:170, width:115.0, height: 20.0))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Nombre anterior"
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
                let textField = UITextField(frame: CGRect(x: 450, y:170, width: 100, height: 20))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Fecha de nacimiento"
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
                let textField = UITextField(frame: CGRect(x: 560, y:170, width: 35, height: 20))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Edad"
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
                let textField = UITextField(frame: CGRect(x: 650, y:170, width: 110, height: 20))
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.placeholder = "Género"
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
        
        let ethField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 580, y:130, width: 135, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Etnicidad"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        ethField.delegate = self
        scrollView.addSubview(ethField)
        scrollView.bringSubviewToFront(ethField)
        
        let addressField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 33, y:255, width: 180, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Direccion de calle"
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
        
        let emailField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 33, y:210, width: 690, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Direccion de correo electronico"
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
        
        
        let cityField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 210, y:255, width: 50, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Ciudad"
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
            let textField = UITextField(frame: CGRect(x: 280, y:255, width: 50, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Estado"
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
            let textField = UITextField(frame: CGRect(x: 350, y:255, width: 50, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Codigo postal"
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
            let textField = UITextField(frame: CGRect(x: 420, y:255, width: 160, height: 20))
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
            let textField = UITextField(frame: CGRect(x: 580, y:255, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Telefono en casa"
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
        
        let minorField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 33, y:295, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Menor de edad"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        minorField.delegate = self
        scrollView.addSubview(minorField)
        scrollView.bringSubviewToFront(minorField)
        
        let guardianField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 230, y:295, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Guardian"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        guardianField.delegate = self
        scrollView.addSubview(guardianField)
        scrollView.bringSubviewToFront(guardianField)
        
        let relationField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 420, y:295, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Relacion"
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
        
        let cellPhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 580, y:295, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Telefono celular"
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
        
        let residencyField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 33, y:335, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Residencia"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        residencyField.delegate = self
        scrollView.addSubview(residencyField)
        scrollView.bringSubviewToFront(residencyField)
        
        let workPhoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 580, y:335, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Telefono en casa"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        workPhoneField.delegate = self
        scrollView.addSubview(workPhoneField)
        scrollView.bringSubviewToFront(workPhoneField)
        
        let occupationField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 33, y:380, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Ocupacion"
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
            let textField = UITextField(frame: CGRect(x: 217, y:380, width: 160, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Empleador"
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
        
        let otherField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 620, y:460, width: 75, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Otro"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        otherField.delegate = self
        scrollView.addSubview(otherField)
        scrollView.bringSubviewToFront(otherField)
        
        let dependField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 256, y:590, width: 75, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Dependientes"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        dependField.delegate = self
        scrollView.addSubview(dependField)
        scrollView.bringSubviewToFront(dependField)
        
        let schoolField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 40, y:680, width: 670, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Escuela"
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
        
        let nameField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 33, y:750, width: 311, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Nombre"
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
        
        let relField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 362, y:750, width: 112, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Relación"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        relField.delegate = self
        scrollView.addSubview(relField)
        scrollView.bringSubviewToFront(relField)
        
        let phoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 495, y:750, width: 90, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Telefono"
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
        
        let workFoneField:UITextField = {
            let textField = UITextField(frame: CGRect(x: 590, y:750, width: 85, height: 20))
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Telefono en trabajo"
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.font = UIFont.systemFont(ofSize: 13)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            return textField
        }()
        workFoneField.delegate = self
        scrollView.addSubview(workFoneField)
        scrollView.bringSubviewToFront(workFoneField)

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
         ref = Database.database().reference()
        //            self.ref.child("AgencyPatientsAdult").childByAutoId().setValue(["Preferred Name": Preferred_Name,
        //                                                                         "First Name": First_Name,
        //                                                                         "Last Name": Last_Name,
        //                                                                         "Middle Name": Middle_Name,
        //                                                                         "Former Name":  Former_Name,
        //                                                                         "Birth Day": Birth_Day,
        //                                                                         "Birth Month": Birth_Month,
        //                                                                         "Birth Year": Birth_Year,
        //                                                                         "Age": Age,
        //                                                                         "Sex": Sex,
        //                                                                         "Gender": Gender,
        //                                                                         "Relationship Status": Relationship_Status,
        //                                                                         "Race" : Race,
        //                                                                         "Ethnicity" : Ethnicity,
        //                                                                         "Street Address": Street_Address,
        //                                                                         "City": City,
        //                                                                         "State": State,
        //                                                                         "Zip": Zip,
        //                                                                         "SSN": SSN,
        //                                                                         "County": County,
        //                                                                         "Davidson": Davidson,
        //                                                                         "Cell": Cell,
        //                                                                         "Occupation": Occupation,
        //                                                                         "Employer": Employer,
        //                                                                         "Employer Phone": Employer_Phone,
        //                                                                         "Preferred Contact": Preferred_Contact,
        //                                                                         "Email": Email,
        //                                                                         "Primary Insurance": Primary_Insurance,
        //                                                                         "Primary Member ID": Primary_Member_ID,
        //                                                                         "Primary Member Name": Primary_Member_Name,
        //                                                                         "Primary Member SSN": Primary_Member_SSN,
        //                                                                         "Primary Member DOB": Primary_Member_DOB,
        //                                                                         "Secondary Insurance": Secondary_Insurance,
        //                                                                         "Secondary Member ID": Secondary_Member_ID,
        //                                                                         "Primary Care Physician": Primary_Care_Physician,
        //                                                                         "Physician Contact": Physician_Contact,
        //                                                                         "Household Income": Household_Income,
        //                                                                         "Number in Household": Number_in_Household,
        //                                                                         "Heard About": Heard_About,
        //                                                                         "Emergency Name": Emergency_Name,
        //                                                                         "Emergency Relationship": Emergency_Relationship,
        //                                                                         "Emergency Home Phone": Emergency_Home_Phone,
        //                                                                         "Emergency Cell Phone": Emergency_Cell_Phone,
        //                                                                         "Date": Date])
        
              let screenshot = self.view.takeScreenshotFifteen()
                        UIImageWriteToSavedPhotosAlbum(screenshot, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
                        
                    }
                    
                    
            @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {           if let error = error {
                        let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        present(ac, animated: true)}
                    else {
                        }
                    }
        }
                extension UIView {
                        func takeScreenshotFifteen() -> UIImage {
                        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                        let image = UIGraphicsGetImageFromCurrentImageContext()
                        UIGraphicsEndImageContext()
                        if image != nil {
                            return image!
                        }
                        return UIImage()
                        
                    }
}
