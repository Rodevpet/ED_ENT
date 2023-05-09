//
//  ContentView.swift
//  
//
//  Created by Rodevpet on 13/11/2022.
//

import SwiftUI

struct LoginView: View{
    var request:Login
    init(request: Login) {
        self.request = request
    }
    @State private var ID:String = ""
    @State private var password:String = ""
    @State private var offset = CGSize.zero
    var body: some View {
        ZStack { Image("Background").padding(.bottom).scaleEffect(0.9).frame(width: UIScreen.main.bounds.size.width)
            VStack(alignment: .center){
                VStack(alignment: .center){
                    TextField("Identifiant", text: $ID, prompt: Text("Identifiant"))
                        .frame(width: 300.0, height: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                        .padding(.leading,10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                                .shadow(radius: 2)
                        )
                        .autocapitalization(.none)
                    SecureField("Password", text: $password, prompt:Text("Mot de Passe"))
                        .frame(width: 300.0, height: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                        .padding(.leading,10)
                        .autocapitalization(.none)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                                .shadow(radius: 2)
                        )
                }
                .padding([.leading, .bottom,.top, .trailing], 18.0)
                .background(Color.white)
                    .cornerRadius(20)
                    .opacity(0.8)
                ZStack {
                    Capsule()
                        .frame(width: 350, height: 75)
                        .foregroundColor(.white)
                        .opacity(0.5)
                        Text("▷").font(.system(size: 36))
                            .foregroundColor(Color(hue: 0.917, saturation: 0.977, brightness: 0.972))
                            .padding(.top)
                            .background( Circle()
                                .frame(width: 70, height: 70)
                                .shadow(color:Color.black, radius: 10)
                                .foregroundColor(Color.white)
                                .padding(.top))
                            .animation(Animation.default.speed(1), value: offset)
                    .padding(.bottom)
                        .padding(.trailing, 275)
                        .offset(x: offset.width, y: 0)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(offset.width)<273 && abs(offset.width) >= 0{
                                        offset = gesture.translation
                                    }
                                }
                                .onEnded { _ in
                                    if abs(offset.width) >= 273 {
                                        do{
                                            try request.Login(ID: ID, PSWD:password)
                                        }catch{
                                            print ("error")
                                        }
                                        if request.DATA.code != 273 {
                                            offset = CGSize.zero
                                        }
                                    } else {
                                            offset = CGSize.zero
                                    }
                                }
                        )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var r:Login = try!Login()
    static var previews: some View {
        LoginView(request: r)
    }
}

