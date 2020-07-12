//
//  AgencyChildFormEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Firebase

class AgencyChildFormEnglishViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
             

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
               let imageName = "AgencyChildFormEnglish1"
               let image = UIImage(named: imageName)
               let imageView = UIImageView(image: image!)
               imageView.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
               stackView.addArrangedSubview(imageView)
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView)
        
             var Preferred_Name =  ""
             var First_Name = ""
             var Last_Name = ""
             var Middle_Name = ""
             var Former_Name = ""
             var Birth_Day =  ""
             var Birth_Month = ""
             var Birth_Year = ""
             var Age = ""
             var Sex = ""
             var Gender = ""
             var Race =  ""
             var Ethnicity = ""
             var Preferred_Contact_Name = ""
             var Preferred_Contact_Relationship = ""
             var Preferred_Contact_Phone = ""
             var Preferred_Contact_Method = ""
             var Preferred_Contact_Email = ""
             var Street_Address = ""
             var City = ""
             var State = ""
             var Zip = ""
             var SSN = ""
             var County = ""
             var Davidson = ""
             var Cell  = ""
             var Primary_Insurance = ""
             var Primary_Member_ID = ""
             var Primary_Member_Name=""
             var Primary_Member_SSN = ""
             var Primary_Member_DOB = ""
             var Primary_Care_Physician =  ""
             var Physician_Contact  = ""
             var Household_Income = ""
             var Number_in_Household = ""
             var Heard_About = ""
             var School = ""
             var DCS_Guardian = ""
             var DCS_Phone = ""
             var Emergency_Name = ""
             var Emergency_Relationship = ""
             var Emergency_Home_Phone = ""
             var Emergency_Cell_Phone = ""
             var Date = ""
        
        ref = Database.database().reference()
        self.ref.child("AgencyPatientsAdult").childByAutoId().setValue(["Preferred Name": Preferred_Name,
                                                                     "First Name": First_Name,
                                                                     "Last Name": Last_Name,
                                                                     "Middle Name": Middle_Name,
                                                                     "Former Name":  Former_Name,
                                                                     "Birth Day": Birth_Day,
                                                                     "Birth Month": Birth_Month,
                                                                     "Birth Year": Birth_Year,
                                                                     "Age": Age,
                                                                     "Sex": Sex,
                                                                     "Gender": Gender,
                                                                     "Race" : Race,
                                                                     "Ethnicity" : Ethnicity,
                                                                     "Preferred Contact Name": Preferred_Contact_Name,
                                                                     "Preferred Contact Relationship": Preferred_Contact_Relationship,
                                                                     "Preferred Contact Phone": Preferred_Contact_Phone,
                                                                     "Preferred Contact Method": Preferred_Contact_Method,
                                                                     "Preferred Contact Email": Preferred_Contact_Email,
                                                                     "Street Address": Street_Address,
                                                                     "City": City,
                                                                     "State": State,
                                                                     "Zip": Zip,
                                                                     "SSN": SSN,
                                                                     "County": County,
                                                                     "Davidson": Davidson,
                                                                     "Cell": Cell,
                                                                     "Primary Insurance": Primary_Insurance,
                                                                     "Primary Member ID": Primary_Member_ID,
                                                                     "Primary Member Name": Primary_Member_Name,
                                                                     "Primary Member SSN": Primary_Member_SSN,
                                                                     "Primary Member DOB": Primary_Member_DOB,
                                                                     "Primary Care Physician": Primary_Care_Physician,
                                                                     "Physician Contact": Physician_Contact,
                                                                     "Household Income": Household_Income,
                                                                     "Number in Household": Number_in_Household,
                                                                     "Heard About": Heard_About,
                                                                     "School": School,
                                                                     "DCS Guardian": DCS_Guardian,
                                                                     "DCS Phone": DCS_Phone,
                                                                     "Emergency Name": Emergency_Name,
                                                                     "Emergency Relationship": Emergency_Relationship,
                                                                     "Emergency Home Phone": Emergency_Home_Phone,
                                                                     "Emergency Cell Phone": Emergency_Cell_Phone,
                                                                     "Date": Date])
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
