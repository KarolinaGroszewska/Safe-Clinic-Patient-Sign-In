//
//  ClinicCompletionEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Photos
import MessageUI

class ClinicCompletionEnglishViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {

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
        firstField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
       return true
    }
    
func fetchPhotos () {
    print("here")
    let fetchOptions = PHFetchOptions()
    fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
        fetchOptions.fetchLimit = 1
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
    
if fetchResult.count > 0 {
    let totalImageCountNeeded = 1
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
let imageData: NSData = images[0].pngData()! as NSData
 mail.addAttachmentData(imageData as Data, mimeType: "image/png", fileName: "imageName.png")
self.present(mail, animated: true, completion: nil)
    }
        
    }
    private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {controller.dismiss(animated: true, completion: nil)
    }
}
