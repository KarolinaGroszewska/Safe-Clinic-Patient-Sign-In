//
//  ClinicFormEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Firebase
import MessageUI

class ClinicFormEnglishViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var signatureView: UIView!
    
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
 
        var Date = ""
        var First_Name  = ""
        var Last_Name = ""
        var Gender = ""
        var Pronouns = ""
        var Address = ""
        var City = ""
        var State = ""
        var Zip = ""
        var Phone = ""
        var Birthday = ""
        var Age = ""
        var Race_or_Ethnicity = ""
        var SSN = ""
        var Assault_Date=""
        var Assault_Location=""
        var Emergency_Contact=""
        var Emergency_Phone=""
        
        
        ref = Database.database().reference()
        self.ref.child("ClinicPatients").childByAutoId().setValue(["Date": Date,
                                                             "First Name": First_Name,
                                                             "Last Name":Last_Name,
                                                             "Gender":Gender,
                                                             "Preferred Pronouns": Pronouns,
                                                             "Street Adress": Address,
                                                             "City":City,
                                                             "State":State,
                                                             "Zip":Zip,
                                                             "Phone":Phone,
                                                             "Birthday":Birthday,
                                                             "Age":Age,
                                                             "Race or Ethnicity":Race_or_Ethnicity,
                                                             "SSN":SSN,
                                                             "Assault Date": Assault_Date,
                                                             "Assault City and State": Assault_Location,
                                                             "Emergency Contact": Emergency_Contact,
                                                             "Emergency Phone":Emergency_Phone])
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

          }

//        func sendEmail() {
//            if MFMailComposeViewController.canSendMail() {
//                let mail = MFMailComposeViewController()
//                mail.mailComposeDelegate = self
//                mail.setToRecipients(["smsliman@aol.com"])
//                mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
//
//                present(mail, animated: true)
//                print("not an error")
//            } else {
//                print("error")
//                // show failure alert
//            }
//        }
//
//        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//            controller.dismiss(animated: true)
//        }
//        sendEmail()
         
    

               func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
              {
                   return imageView
              }
}
