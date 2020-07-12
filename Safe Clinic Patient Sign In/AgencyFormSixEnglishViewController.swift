//
//  AgencyFormSixEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormSixEnglishViewController: UIViewController, UITextFieldDelegate {
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
