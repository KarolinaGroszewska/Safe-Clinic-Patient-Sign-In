//
//  AgencyAdultFormEnglishViewController.swift
//  Safe Clinic Patient Sign In
//
//  Created by Karolina on 7/10/20.
//  Copyright © 2020 Karolina Groszewska. All rights reserved.
//

import UIKit
import Firebase

class AgencyAdultFormEnglishViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var signatureView: SignatureView!
    
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
         scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
         scrollView.minimumZoomScale = 1
         scrollView.maximumZoomScale = 3
         scrollView.bounces=false
         self.view.addSubview(scrollView)

         image.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
         image.contentMode = .scaleToFill
         scrollView.addSubview(image)
         scrollView.addSubview(signatureView)
         scrollView.bringSubviewToFront(image)
         scrollView.bringSubviewToFront(signatureView)
        
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
        var Relationship_Status = ""
        var Race =  ""
        var Ethnicity = ""
        var Street_Address = ""
        var City = ""
        var State = ""
        var Zip = ""
        var SSN = ""
        var County = ""
        var Davidson = ""
        var Cell  = ""
        var Occupation = ""
        var Employer = ""
        var Employer_Phone = ""
        var Preferred_Contact = ""
        var Email = ""
        var Primary_Insurance = ""
        var Primary_Member_ID = ""
        var Primary_Member_Name=""
        var Primary_Member_SSN = ""
        var Primary_Member_DOB = ""
        var Secondary_Insurance = ""
        var Secondary_Member_ID = ""
        var Primary_Care_Physician =  ""
        var Physician_Contact  = ""
        var Household_Income = ""
        var Number_in_Household = ""
        var Heard_About = ""
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
                                                                     "Relationship Status": Relationship_Status,
                                                                     "Race" : Race,
                                                                     "Ethnicity" : Ethnicity,
                                                                     "Street Address": Street_Address,
                                                                     "City": City,
                                                                     "State": State,
                                                                     "Zip": Zip,
                                                                     "SSN": SSN,
                                                                     "County": County,
                                                                     "Davidson": Davidson,
                                                                     "Cell": Cell,
                                                                     "Occupation": Occupation,
                                                                     "Employer": Employer,
                                                                     "Employer Phone": Employer_Phone,
                                                                     "Preferred Contact": Preferred_Contact,
                                                                     "Email": Email,
                                                                     "Primary Insurance": Primary_Insurance,
                                                                     "Primary Member ID": Primary_Member_ID,
                                                                     "Primary Member Name": Primary_Member_Name,
                                                                     "Primary Member SSN": Primary_Member_SSN,
                                                                     "Primary Member DOB": Primary_Member_DOB,
                                                                     "Secondary Insurance": Secondary_Insurance,
                                                                     "Secondary Member ID": Secondary_Member_ID,
                                                                     "Primary Care Physician": Primary_Care_Physician,
                                                                     "Physician Contact": Physician_Contact,
                                                                     "Household Income": Household_Income,
                                                                     "Number in Household": Number_in_Household,
                                                                     "Heard About": Heard_About,
                                                                     "Emergency Name": Emergency_Name,
                                                                     "Emergency Relationship": Emergency_Relationship,
                                                                     "Emergency Home Phone": Emergency_Home_Phone,
                                                                     "Emergency Cell Phone": Emergency_Cell_Phone,
                                                                     "Date": Date])
   }    

        
        func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
        {
             return image
        }
  

}
