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
    @IBOutlet weak var stackView: UIStackView!
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        ref = Database.database().reference()
//        self.ref.child("ClinicPatients").childByAutoId().setValue(["Date": "Date",
//                                                             "First Name": "Name",
//                                                             "Last Name":"Name",
//                                                             "Gender":"Gender",
//                                                             "Preferred Pronouns": "They/Them",
//                                                             "Street Adress": "Street Address",
//                                                             "City":"City", "State":"State",
//                                                             "Zip":"Zip",
//                                                             "Phone":"Phone",
//                                                             "Birthday":"Birthday",
//                                                             "Age":"Age",
//                                                             "Race or Ethnicity":"Race",
//                                                             "SSN":"SSN",
//                                                             "Assault Date": "Date",
//                                                             "Assault City and State": "City, State",
//                                                             "Emergency Contact": "Emergency Contact",
//                                                             "Emergency Phone":"Phone"])
    scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
    scrollView.minimumZoomScale = 1
    scrollView.maximumZoomScale = 3
    scrollView.bounces=false
    self.view.addSubview(scrollView)

    imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
    imageView.contentMode = .scaleToFill
    scrollView.addSubview(imageView)

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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
