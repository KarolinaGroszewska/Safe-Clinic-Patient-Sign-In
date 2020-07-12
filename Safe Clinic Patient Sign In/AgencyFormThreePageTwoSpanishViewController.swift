//
//  AgencyFormThreePageTwoSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/11/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit

class AgencyFormThreePageTwoSpanishViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollViews: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureViewOne: SignatureView!
    @IBOutlet weak var signatureViewTwo: SignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViews.frame = CGRect(x: 0, y: 0, width: scrollViews.frame.width, height: scrollViews.frame.height)
                   scrollViews.minimumZoomScale = 1
                   scrollViews.maximumZoomScale = 3
                   scrollViews.bounces=false
                   self.view.addSubview(scrollViews)

                   imageView.frame = CGRect(x: 0, y: 0, width: scrollViews.frame.width, height: scrollViews.frame.height)
                   imageView.contentMode = .scaleToFill
                   scrollViews.addSubview(imageView)
                   scrollViews.addSubview(signatureViewOne)
                   scrollViews.addSubview(signatureViewTwo)
                   scrollViews.bringSubviewToFront(imageView)
                   scrollViews.bringSubviewToFront(signatureViewOne)
                   scrollViews.bringSubviewToFront(signatureViewTwo)
        
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
                    scrollViews.addSubview(firstField)
                    scrollViews.bringSubviewToFront(firstField)

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
                  let screenshot = self.view.takeScreenshotTwentyOne()
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
                                func takeScreenshotTwentyOne() -> UIImage {
                                drawHierarchy(in: self.bounds, afterScreenUpdates: true)
                                let image = UIGraphicsGetImageFromCurrentImageContext()
                                UIGraphicsEndImageContext()
                                if image != nil {
                                    return image!
                                }
                                return UIImage()
                                
                            }
        }
