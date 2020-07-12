//
//  AgencyCompletionSpanishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Photos
import MessageUI

class AgencyCompletionSpanishViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate  {
    
    var images:[UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
            fetchPhotos()
            
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
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
        }

    
    func fetchPhotos () {
        print("here")
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
            fetchOptions.fetchLimit = 13
            let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
    if fetchResult.count > 0 {
        let totalImageCountNeeded = 13
        fetchPhotoAtIndex(0, totalImageCountNeeded, fetchResult)
            
        }
     }
        func fetchPhotoAtIndex(_ index:Int, _ totalImageCountNeeded: Int, _ fetchResult: PHFetchResult<PHAsset>) {
    let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            
        PHImageManager.default().requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: view.frame.size, contentMode: PHImageContentMode.aspectFill, options: requestOptions, resultHandler: {
            (image, _) in
            if let image = image {
                self.images += [image]
    }
            if index + 1 < fetchResult.count && self.images.count < totalImageCountNeeded {
                self.fetchPhotoAtIndex(index + 1, totalImageCountNeeded, fetchResult)
                
            }
            else {
                print("Completed array: \(self.images)")
    }
        })
    }
        func sendMail() {
    if MFMailComposeViewController.canSendMail() {
    let mail = MFMailComposeViewController()
    mail.mailComposeDelegate = self
    mail.setCcRecipients(["smsliman@aol.com"])
    mail.setSubject("Your SAC forms")
    mail.setMessageBody("Message body", isHTML: false)
    let imageData1: NSData = images[0].pngData()! as NSData
        let imageData2: NSData = images[1].pngData()! as NSData
        let imageData3: NSData = images[2].pngData()! as NSData
        let imageData4: NSData = images[3].pngData()! as NSData
        let imageData5: NSData = images[4].pngData()! as NSData
        let imageData6: NSData = images[5].pngData()! as NSData
        let imageData7: NSData = images[6].pngData()! as NSData
        let imageData8: NSData = images[7].pngData()! as NSData
        let imageData9: NSData = images[8].pngData()! as NSData
        let imageData10: NSData = images[9].pngData()! as NSData
        let imageData11: NSData = images[10].pngData()! as NSData
        let imageData12: NSData = images[11].pngData()! as NSData
        let imageData13: NSData = images[12].pngData()! as NSData
     mail.addAttachmentData(imageData1 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData2 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData3 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData4 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData5 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData6 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData7 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData8 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData9 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData10 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData11 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData12 as Data, mimeType: "image/png", fileName: "imageName.png")
        mail.addAttachmentData(imageData13 as Data, mimeType: "image/png", fileName: "imageName.png")


    self.present(mail, animated: true, completion: nil)
        }
            
        }
        private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {controller.dismiss(animated: true, completion: nil)
        }
    }
