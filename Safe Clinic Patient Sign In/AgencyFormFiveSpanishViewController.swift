//
//  AgencyFormFiveSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormFiveSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signatureViewOne: SignatureView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureViewTwi: SignatureView!
    
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
                scrollView.addSubview(signatureViewTwi)
                scrollView.bringSubviewToFront(imageView)
                scrollView.bringSubviewToFront(signatureViewOne)
                scrollView.bringSubviewToFront(signatureViewTwi)
        
                let nameField:UITextField = {
                    let textField = UITextField(frame: CGRect(x: 319.0, y:600.0, width: 186.0, height: 30.0))
                    textField.translatesAutoresizingMaskIntoConstraints = false
                    textField.placeholder = "Legal Name"
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
                    let textField = UITextField(frame: CGRect(x: 283.0, y:675.0, width: 166.0, height: 30.0))
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
                    let textField = UITextField(frame: CGRect(x: 536.0, y:602.0, width: 108.0, height: 30.0))
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
                    let textField = UITextField(frame: CGRect(x: 463.0, y:677.0, width: 115.0, height: 30.0))
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
                    let textField = UITextField(frame: CGRect(x: 584.0, y:678.0, width: 83.0, height: 30.0))
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
    @IBAction func onSubmit(_ sender: Any) {
           let screenshot = self.view.takeScreenshotTwentyFour()
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
                                func takeScreenshotTwentyFour() -> UIImage {
                                drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                                let image = UIGraphicsGetImageFromCurrentImageContext()
                                UIGraphicsEndImageContext()
                                if image != nil {
                                    return image!
                                }
                                return UIImage()
                                
                            }
        }
