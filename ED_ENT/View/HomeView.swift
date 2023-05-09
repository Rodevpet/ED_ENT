//
//  Home_View.swift
//  ED_ENT
//
//  Created by Robin PETIT on 09/01/2023.
//

import SwiftUI

struct HomeView: View {
     var DATA:LoginDataStruct_root
     let accounts:LoginDataStruct_accounts?
     init(DATA: LoginDataStruct_root) {
          self.DATA = DATA
          accounts = try? DATA.data?.accounts[0]
     }
     var body: some View {
          NavigationView{
               ZStack {
                    Rectangle()
                         .frame(height: UIScreen.main.bounds.size.height)
                         .foregroundColor(Color.white)
                    VStack (alignment: .center,spacing: 40){
                         ZStack (alignment: .leading){
                              Capsule()
                                   .padding(0.0)
                                   .frame(width: 350.0, height: 50.0)
                                   .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                              
                              HStack {
                                   Group{
                                        Image("Icon")
                                             .frame(width: 45.0, height: 45.0)
                                             .cornerRadius(/*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                                   }.padding(.leading, 3.0)
                                   
                                   VStack (alignment: .leading){
                                        HStack {
                                             Text(accounts!.prenom)
                                                  .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                                             Text(accounts!.nom)
                                                  .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                                        }
                                        HStack {
                                             Text(accounts!.nomEtablissement)
                                                  .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.809))
                                                  .lineLimit(nil)
                                                  .italic()
                                             Text(accounts!.profile.classe.code)
                                                  .foregroundColor(Color(red: 0.803, green: 0.808, blue: 0.808))
                                                  .lineLimit(nil)
                                                  .italic()
                                             
                                        }
                                   }
                              }
                         }
                         Capsule()
                              .padding(0.0)
                              .frame(width: 350.0, height: 50.0)
                              .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                         HStack (alignment: .top, spacing: 50){
                              
                              Button(action: {}){
                                   Image("Cloud Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                              NavigationLink(destination: Notes()){
                                        Image("Grade Button").scaleEffect(0.45)
                                             .frame(width: 90.0, height: 90.0)
                                             .clipShape(Hexagon(width: 90, height: 90))
                                        .shadow(radius: 5)
                              }
                              
                              Button(action: {}){
                                   Image("Planning Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                                   
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                         }
                         HStack (alignment: .top, spacing: 50){
                              Button(action: {}){
                                   Image("Workspace Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                                   
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                              Button(action: {}){
                                   Image("Homework Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                                   
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                              Button(action: {}){
                                   Image("Message Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                                   
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                              
                         }
                         HStack (alignment: .top, spacing: 50){
                              Button(action: {}){
                                   Image("File Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                                   
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                              Button(action: {}){
                                   Image("Homework Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                                   
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                              Button(action: {}){
                                   Image("Message Button").scaleEffect(0.45)
                                        .frame(width: 90.0, height: 90.0)
                                   
                              }.clipShape(Hexagon(width: 90, height: 90))
                                   .frame(width: 90.0, height: 90.0)
                                   .shadow(radius: 5)
                         }
                    }
               }
               
               
          }
     }
}
struct Home_View_Previews: PreviewProvider {
     static var DATA:LoginDataStruct_root = LoginDataStruct_root(code: 0, token: "Empty", message: "Empty", data: LoginDataStruct_data(changementMDP: true, accounts: [LoginDataStruct_accounts(id: 0, identifiant: "Empty", prenom: "Empty", nom: "Empty", email: "Empty", anneeScolaireCourante: "Empty", nomEtablissement: "Empty",profile: (LoginDataStruct_profile(sexe: "ND", classe: LoginDataStruct_classe(code: "ND"), photo: "None")), modules: [LoginDataStruct_modules(code: "Empty", enable: false, ordre: 0, badge: 0)])]))
     static var previews: some View {
          HomeView(DATA:DATA)
               .preferredColorScheme(.light)
     }
}
