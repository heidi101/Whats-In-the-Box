//
//  What_s_In_the_Box_App.swift
//  What's In the Box?
//
//  Created by HL on 5/25/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct What_s_In_the_Box_App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey :Any]? = nil)-> Bool {
        FirebaseApp.configure()
        
        return true
    }
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
    
    //new addition for google drive api
    func application2(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GIDSignIn.sharedInstance.clientID = "315977733569-bhrn1k9pguf6g6tsje0kkad4qm7dsf0a.apps.googleusercontent.com"
        return true
    }
}
