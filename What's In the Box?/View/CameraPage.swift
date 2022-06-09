//
//  CameraPage.swift
//  What's In the Box?
//
//  Created by HL on 5/27/22.
//

import Foundation
import SwiftUI

//Title: The Complete Guide for Integrating Camera and Photo Library in SwiftUI
//Accessed: 5/29/22
//at: https://www.youtube.com/watch?v=Y-65T0YBOm4

struct CameraPage: View {
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage? 
    
    var body: some View {
        
        VStack {
                
            Image(systemName: "photo")
                //.font(.title)
                .font(.system(size: 100))
                .foregroundColor(Color("Brown"))
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
                
            Button("Choose Picture") {
                self.showSheet = true
                    
            }.padding()
                .actionSheet(isPresented: $showSheet){
                    ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons:[
                        .default(Text("Photo Library")) {
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                        },
                        .default(Text("Camera")) {
                            self.showImagePicker = true
                            self.sourceType = .camera
                        },
                        .cancel()
                    ])
                }
            
        }
        .offset(y: -60)
        .sheet(isPresented: $showImagePicker){
            ImagePicker(image: $image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
        //Image(uiImage: image ?? UIImage(named: "placeholder")!)
    }
}

struct CameraPage_Previews: PreviewProvider {
    static var previews: some View {
        CameraPage()
    }
}
