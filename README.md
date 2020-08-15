# Safe-Clinic-Patient-Sign-In

The Safe Clinic Patient Sign In app was created for the Sexual Assault Center (SAC), a non-profit organization in Nashville, TN. 

The project helps both the staff and visitors of the SAC with completing all of the necessary incoming patient paperwork. Instead of having to fill out and sign individual forms, Safe Clinic Patient Sign In allows for them to have all of the forms for various clients coming in available in one location. After selecting their preferred language and location, the client is lead through all of the paperwork necessary for their visit, which is entirely editable, and includes checkboxes for selection menus, text fields for personal information, and the ability to sign all spots where a signature would be required with a finger or stylus. 

All of the information that is then collected from the client is sent up to a secure database ran by Firebase. This allows for the staff members of the SAC to easily filter this information by specific patients, while granting them access to these records from any location with an internet connection.

In order to run the app, download the entire file from github, and open the .xcworkspaces file found in the main folder. .xcworkspaces is the file that contains the firebase functionalities, required for access to all functions of the app. The app can be launched using xcode's built-in builder and runner, as long as the selected run file is "Safe Clinic Project Sign In".

This app was built to run on Swift 5 and iOS 13, and has been tested most with those configurations, though no issues on any other configurations have been found so far.
