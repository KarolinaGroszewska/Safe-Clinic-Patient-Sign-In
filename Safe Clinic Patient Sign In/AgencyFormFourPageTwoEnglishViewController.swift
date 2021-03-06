//
//  AgencyFormFourPageTwoEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/11/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormFourPageTwoEnglishViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureViewOne: UIView!
    @IBOutlet weak var signatureViewTwo: UIView!
    
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
            
             }
             
             func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
             {
                  return imageView
             }
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
     }
     @IBAction func onSubmit(_ sender: Any) {
         let screenshot = self.view.takeScreenshotFourteen()
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
                         func takeScreenshotFourteen() -> UIImage {
                         drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                         let image = UIGraphicsGetImageFromCurrentImageContext()
                         UIGraphicsEndImageContext()
                         if image != nil {
                             return image!
                         }
                         return UIImage()
                         
                     }
     }
     
