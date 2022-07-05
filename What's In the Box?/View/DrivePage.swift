//
//  DrivePage.swift
//  What's In the Box?
//
//  Created by HL on 6/6/22.
//

import Foundation
import SwiftUI
import GoogleSignIn
import GoogleAPIClientForRESTCore

//Title: Integrate Google Drive to iOS App
//On: 6/6/22
//From: https://uynguyen.github.io/2019/02/15/Integrate-Google-Drive-to-iOS-app/
//And: https://medium.com/@kgleong/uploading-files-to-google-drive-using-the-google-ios-sdk-fcad3e9d6c07
class ViewController: UIViewController {
    let googleDriveService = GTLRDriveService()
    var googleUser: GIDGoogleUser?
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.scopes =
            [kGTLRAuthScopeDrive]
        
        GIDSignIn.sharedInstance()?.signInSilently()
        // ...
    }
}


struct DrivePage: View {
    var body: some View {
        Text("Hi")
    }
    
}

/*public func search(_ name: String, onCompleted: @escaping (GTLRDrive_File?, Error?) -> ()) {
    let query = GTLRDriveQuery_FilesList.query()
    query.pageSize = 1
    query.q = "name contains '\(name)'"
    self.service.executeQuery(query) { (ticket, results, error) in
        onCompleted((results as? GTLRDrive_FileList)?.files?.first, error)
    }
}*/



struct DrivePage_Previews: PreviewProvider {
    static var previews: some View {
        DrivePage()
    }
}
