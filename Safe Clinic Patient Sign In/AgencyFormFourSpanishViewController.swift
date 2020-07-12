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
    

    @IBAction func onSubmit(_ sender: Any) {
        
              let screenshot = self.view.takeScreenshotTwentyTwo()
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
                                func takeScreenshotTwentyTwo() -> UIImage {
                                drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                                let image = UIGraphicsGetImageFromCurrentImageContext()
                                UIGraphicsEndImageContext()
                                if image != nil {
                                    return image!
                                }
                                return UIImage()
                                
                            }
        }
