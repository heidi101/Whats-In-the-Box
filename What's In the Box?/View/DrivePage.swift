//
//  DrivePage.swift
//  What's In the Box?
//
//  Created by HL on 6/6/22.
//

import Foundation
import SwiftUI

//Title: Integrate Google Drive to iOS App
//On: 6/6/22
//From: https://uynguyen.github.io/2019/02/15/Integrate-Google-Drive-to-iOS-app/
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
