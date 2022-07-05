//
//  QRGeneratorPage.swift
//  What's In the Box?
//
//  Created by HL on 7/4/22.
//

import Foundation
import SwiftUI

struct QRGeneratorPage: View {
    
    @State private var urlInput: String = ""
    @State private var qrCode: QRCode?
    
    private let qrCodeGenerator = QRCodeGenerator()
    @ObservedObject private var imageSaver = ImageSaver()
    
    var body : some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        TextField("Enter url:", text: $urlInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.URL)
                            .keyboardType(.URL)
                        
                        Button("Generate") {
                            UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
                            qrCode = qrCodeGenerator.generateQRCode(forUrlString: urlInput)
                            urlInput = ""
                        }
                        .disabled(urlInput.isEmpty)
                        .padding(.leading)
                    }
                    
                    Spacer()
                    
                    if qrCode == nil {
                        EmptyStateView(width: geometry.size.width)
                    } else {
                        QRCodeView(qrCode: qrCode!, width: geometry.size.width)
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitle("QR Code")
                .navigationBarItems(trailing: Button(action: {
                    assert(qrCode != nil, "Cannot save nil QR code image")
                    imageSaver.saveImage(qrCode!.uiImage)
                }) {
                    Image(systemName: "square.and.arrow.down")
                }
                .disabled(qrCode == nil))
                .alert(item: $imageSaver.saveResult){ saveResult in
                    return alert(forSaveStatus: saveResult.saveStatus)
                }
            }
        
        }
    }
    
    private func alert(forSaveStatus saveStatus: ImageSaveStatus) -> Alert {
        switch saveStatus {
        case .success:
            return Alert(
                title: Text("Success!"),
                message: Text("The QR code was saved to your photo library.")
            )
        case .error:
            return Alert(
                title: Text("Oops!"),
                message: Text("An error occurred while saving your QR code.")
            )
        case .libraryPermissionDenied:
            return Alert(
                title: Text("Oops!"),
                message: Text("This app needs permission to add photos to your library."),
                primaryButton: .cancel(Text("Ok")),
                secondaryButton: .default(Text("Open Settings")) {
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
                    UIApplication.shared.open(settingsUrl)
                }
            )
        }
    }
}

struct QRCodeView: View {
    let qrCode: QRCode
    let width: CGFloat
    
    var body : some View {
        VStack {
            Label("QR code for \(qrCode.urlString):", systemImage: "qrcode.viewfinder")
                .lineLimit(3)
            Image(uiImage: qrCode.uiImage)
                .resizable()
                .frame(width: width * 2 / 3, height: width * 2 / 3)
        }
    }
}

struct EmptyStateView: View {
    let width: CGFloat
    
    private var imageLength: CGFloat {
        width / 2.5
    }
    
    var body: some View {
        VStack {
            Image(systemName: "qrcode")
                .resizable()
                .frame(width: imageLength, height: imageLength)
            Text("Create QR Code")
                .padding(.top)
        }
        .foregroundColor(Color(UIColor.systemGray))
    }
}

struct QRGeneratorPage_Previews: PreviewProvider {
    static var previews: some View {
        QRGeneratorPage()
    }
}
























/*
//Title: QR Code Generator in SwiftUI
//Accessed on: 7/4/22
//At: https://www.youtube.com/watch?v=wQ5oa-_zgI8

struct QRGeneratorPage: View {
    @State var txt = ""
    var body: some View {
        
        VStack {
            TextField("Enter Data", text: $txt).textFieldStyle(RoundedBorderTextFieldStyle())
            
            if txt != "" {
                Image(uiImage: UIImage(data: returnData(str: self.txt))!).resizable().frame(width: 150, height: 150)
            }
        }.padding()
    }
    
    func returnData(str : String)->Data{
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiimage = UIImage(ciImage: image!)
        return uiimage.pngData()!
    }
}

struct QRGeneratorPage_Previews: PreviewProvider {
    static var previews: some View {
        QRGeneratorPage()
    }
}
*/
