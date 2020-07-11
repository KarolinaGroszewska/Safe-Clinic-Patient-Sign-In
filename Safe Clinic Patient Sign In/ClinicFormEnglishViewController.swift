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
        self.ref.child("ClinicPatients").childByAutoId().setValue(["Date": "Date",
                                                             "First Name": "Name",
                                                             "Last Name":"Name",
                                                             "Gender":"Gender",
                                                             "Preferred Pronouns": "They/Them",
                                                             "Street Adress": "Street Address",
                                                             "City":"City", "State":"State",
                                                             "Zip":"Zip",
                                                             "Phone":"Phone",
                                                             "Birthday":"Birthday",
                                                             "Age":"Age",
                                                             "Race/Ethnicity":"Race",
                                                             "SSN":"SSN",
                                                             "Assault Date": "Date",
                                                             "Assault City/State": "City, State",
                                                             "Emergency Contact": "Emergency Contact",
                                                             "Emergency Phone":"Phone"])
    
        
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
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 23.0
        scrollView.addSubview(stackView)

        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView as Any]))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView as Any]))
        let imageName = "ClincAgencyFormEnglish1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        stackView.addArrangedSubview(imageView)
        //Imageview on Top of View
        self.view.bringSubviewToFront(imageView)    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
