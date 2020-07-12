//
//  AgencyFormFourPageTwoSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/11/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormFourPageTwoSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signatureView: SignatureView!
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
                  scrollView.addSubview(signatureView)
                  scrollView.bringSubviewToFront(imageView)
                  scrollView.bringSubviewToFront(signatureView)
        
                  let dateField:UITextField = {
                      let textField = UITextField(frame: CGRect(x: 488.0, y:677.0, width: 129.0, height: 30.0))
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
        
                  let dateTwoField:UITextField = {
                      let textField = UITextField(frame: CGRect(x: 490.0, y:742.0, width: 143.0, height: 30.0))
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
        
                  let therapistField:UITextField = {
                      let textField = UITextField(frame: CGRect(x: 104.0, y:740.0, width: 334.0, height: 30.0))
                      textField.translatesAutoresizingMaskIntoConstraints = false
                      textField.placeholder = "Therapist"
                      textField.keyboardType = UIKeyboardType.default
                      textField.returnKeyType = UIReturnKeyType.done
                      textField.autocorrectionType = UITextAutocorrectionType.no
                      textField.font = UIFont.systemFont(ofSize: 13)
                      textField.borderStyle = UITextField.BorderStyle.roundedRect
                      textField.clearButtonMode = UITextField.ViewMode.whileEditing;
                      textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                      return textField
                  }()
                  therapistField.delegate = self
                  scrollView.addSubview(therapistField)
                  scrollView.bringSubviewToFront(therapistField)

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
                  let screenshot = self.view.takeScreenshotSixteen()
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
                                func takeScreenshotSixteen() -> UIImage {
                                drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                                let image = UIGraphicsGetImageFromCurrentImageContext()
                                UIGraphicsEndImageContext()
                                if image != nil {
                                    return image!
                                }
                                return UIImage()
                                
                            }
        }
