//
//  AgencyFormEightSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormEightSpanishViewController: UIViewController, UITextFieldDelegate {
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
        let nameField:UITextField = {
                    let textField = UITextField(frame: CGRect(x: 327.0, y:700.0, width: 210.0, height: 30.0))
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
                    let textField = UITextField(frame: CGRect(x: 279.0, y:792.0, width: 210.0, height: 30.0))
                    textField.translatesAutoresizingMaskIntoConstraints = false
                    textField.placeholder = "Guardian Name"
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
                    let textField = UITextField(frame: CGRect(x: 575.0, y:700.0, width: 92.0, height: 30.0))
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
                    let textField = UITextField(frame: CGRect(x: 511.0, y:793.0, width: 92.0, height: 30.0))
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
                    let textField = UITextField(frame: CGRect(x: 607.0, y:793.0, width: 55.0, height: 30.0))
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
                  let screenshot = self.view.takeScreenshotTwentySeven()
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
                                func takeScreenshotTwentySeven() -> UIImage {
                                drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                                let image = UIGraphicsGetImageFromCurrentImageContext()
                                UIGraphicsEndImageContext()
                                if image != nil {
                                    return image!
                                }
                                return UIImage()
                                
                            }
        }
