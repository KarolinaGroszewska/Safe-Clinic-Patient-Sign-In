# Safe-Clinic-Patient-Sign-In





This app was built to run on Swift 5 and iOS 13, and has been tested most with those configurations, though no issues on any other configurations have been found so far.

## Safe Clinic Patient Sign In

The Safe Clinic Patient Sign In app was created for the Sexual Assault Center (SAC), a non-profit organization in Nashville, TN. Built with Swift and Ruby.

#### Status:   

This project is currently in development. Users have access to most of the forms from the SAC, and can fill out most of their personal information on those forms. Their information is currently stored on Firebase. 

#### Installation and Setup Instructions:  

In order to run the app, download the entire file from github, and open the .xcworkspaces file found in the main folder. .xcworkspaces is the file that contains the firebase functionalities, required for access to all functions of the app. The app can be launched using xcode's built-in builder and runner, as long as the selected run file is "Safe Clinic Project Sign In".

#### Goal:   
The project helps both the staff and visitors of the SAC with completing all of the necessary incoming patient paperwork. Instead of having to fill out and sign individual forms, Safe Clinic Patient Sign In allows for them to have all of the forms for various clients coming in available in one location. After selecting their preferred language and location, the client is lead through all of the paperwork necessary for their visit, which is entirely editable, and includes checkboxes for selection menus, text fields for personal information, and the ability to sign all spots where a signature would be required with a finger or stylus. 

All of the information that is then collected from the client is sent up to a secure database ran by Firebase. This allows for the staff members of the SAC to easily filter this information by specific patients, while granting them access to these records from any location with an internet connection.

#### Reflection:  

This was a project initially started for VandyHacks, organized by the students at Vanderbilt University. As a group, we had entered the hackathon and matched with a non-profit organization who wanted to have a project. We have been working on the project intermittently for four weeks. 

Our goal was to build an iPad app that organized all of the forms the SAC had, allowed visitors of the clinic to access and complete all of them, and then stored their information in a secure and easily accessible location for the SAC.

The technologies implemented in this project are Swift and its various sublibraries, CocoaPods (built with Ruby), and Google Firebase. We chose Swift due to our own previous programming experiences and the need for an iPad-only app, and Google Firebase and CocoaPods for their reliability and easier access than CloudKit or CoreData
