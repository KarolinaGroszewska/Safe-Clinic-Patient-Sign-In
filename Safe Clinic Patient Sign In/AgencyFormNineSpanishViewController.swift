//
//  AgencyFormNineSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormNineSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureView: SignatureView!
    
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
        
        let nameField:UITextField = {
                    let textField = UITextField(frame: CGRect(x: 117.0, y:295.0, width: 152.0, height: 30.0))
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
        
                let dateField:UITextField = {
                    let textField = UITextField(frame: CGRect(x: 471.0, y:757.0, width: 172.0, height: 30.0))
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
        
                let contactField:UITextField = {
                    let textField = UITextField(frame: CGRect(x: 104.0, y:809.0, width: 369.0, height: 30.0))
                    textField.translatesAutoresizingMaskIntoConstraints = false
                    textField.placeholder = "Agency Contact"
                    textField.keyboardType = UIKeyboardType.default
                    textField.returnKeyType = UIReturnKeyType.done
                    textField.autocorrectionType = UITextAutocorrectionType.no
                    textField.font = UIFont.systemFont(ofSize: 13)
                    textField.borderStyle = UITextField.BorderStyle.roundedRect
                    textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                    textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                    return textField
                }()
                contactField.delegate = self
                scrollView.addSubview(contactField)
                scrollView.bringSubviewToFront(contactField)
        
                let dateTwoField:UITextField = {
                    let textField = UITextField(frame: CGRect(x: 492.0, y:807.0, width: 178.0, height: 30.0))
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
             let screenshot = self.view.takeScreenshotTwentyEight()
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
                                func takeScreenshotTwentyEight() -> UIImage {
                                drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                                let image = UIGraphicsGetImageFromCurrentImageContext()
                                UIGraphicsEndImageContext()
                                if image != nil {
                                    return image!
                                }
                                return UIImage()
                                
                            }
        }
