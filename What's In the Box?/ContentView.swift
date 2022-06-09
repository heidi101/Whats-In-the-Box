//
//  ContentView.swift
//  What's In the Box?
//
//  Created by HL on 5/25/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    @AppStorage("log_Status") var log_Status = false
        var body: some View {
            if log_Status{
                NavigationView{
                    VStack(spacing: 10){
                        ScrollView {
                            Home()
                            Text("Logged in!")
                            
                            Button{
                                GIDSignIn.sharedInstance.signOut()
                                try? Auth.auth().signOut()
                                
                                withAnimation{
                                    log_Status = false
                                }
                            } label: {
                                Text("Logout")
                                    .foregroundColor(Color("Brown"))
                            }
                        }
                    }
                }
            } else {
                LoginPage()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Title: SwiftUI Complex UI Tutorials - Custom Inline Curves and Custom Shapes in SwiftUI
//Author: Kavsoft
//Accessed: 5/27/22
//At: https://www.youtube.com/watch?v=_K-Hp0nuWlI
struct Home: View {
    
    var body: some View {
        
        VStack(spacing: 0){
            
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "circle.grid.2x2")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("profile")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
            .padding(.bottom, 80)
            .background(Color("Brown"))
            .clipShape(Corners(corner: [.bottomRight], size: CGSize(width: 55, height: 55)))
            .offset(y: -150)
            
            HStack {
                
                VStack {
                    
                    //image (N/A for now)
                    HStack {
                        
                        Spacer()
                        
                        Image("pic")
                            .resizable()
                            .frame(width: 170, height: 130)
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text("Welcome")
                                .font(.title)
                            
                            Text("Scan your \nnew Box!")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.leading, 30)
                }
                //custom width
                .padding(.bottom, 35)
                .frame(width: UIScreen.main.bounds.width - 100)
                .background(Color("Tan"))
                .clipShape(Corners(corner: [.topLeft,.topRight,.bottomRight], size: CGSize(width: 90, height: 90)))
                .offset(y: -160)
                
                Spacer()
                  
            }
            .padding(.top, -70)
            
            ZStack {
                
                Color("Tan")
                
                VStack {
                    
                    HStack {
                        
                        Text("Explore QR codes")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .padding(.top, 20)
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "ellipsis")
                                .font(.title)
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.leading, 35)
                    .padding(.top, 15)
                    .padding(.trailing)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        CardView()
                            .padding(.top, 25)
                    }
                    
                    Spacer()
                }
                .background(Color.white)
                .clipShape(Corners(corner: [.topLeft], size: CGSize(width: 70, height: 70)))
            }
            .offset(y: -160)
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

//source that helped me understand NavigationView and NavigationLink: https://www.youtube.com/watch?v=IopCl8sOyFA
struct CardView : View {
    @State var index = 0
    
    var body: some View {
        HStack(spacing: 25){
            VStack(spacing: 12){

                NavigationLink(destination: CameraPage(), label: {
                    Image(systemName: "camera")
                        //.font(.title)
                        .font(.system(size: 90))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                })
                
                
                Text("New Box")
                    .foregroundColor(self.index == 0 ? .white : .black)
            }
            .padding(.horizontal, 1)
            .padding(.vertical, 30)
            .background(self.index == 0 ? Color("Brown") : Color("Tan"))
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 0
            }
            
            VStack(spacing: 12){

                NavigationLink(destination: Text("QR"), label: {
                    Image(systemName: "qrcode")
                        //.font(.title)
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                })
                
                
                Text("View Previous")
                    .foregroundColor(self.index == 0 ? .black : .black)
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 30)
            .background(self.index == 3 ? Color("Brown") : Color("Tan"))
            .clipShape(Capsule())
            .onTapGesture {
                self.index = 3
            }
        }
        .padding(.horizontal, 30)
    }
}


struct Corners : Shape {
    var corner : UIRectCorner
    var size : CGSize
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        return Path(path.cgPath)
    }
    
}

