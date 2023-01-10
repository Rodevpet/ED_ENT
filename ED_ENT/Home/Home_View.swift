//
//  Home_View.swift
//  ED_ENT
//
//  Created by Robin PETIT on 09/01/2023.
//

import SwiftUI

struct Home_View: View {
    var body: some View {
         VStack (alignment: .leading,spacing: 40){
              HStack (alignment: .top, spacing: 50){
                   Button(action: {}){
                             Image("Cloud Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                        .frame(width: 90.0, height: 90.0)
                   Button(action: {}){
                             Image("Grade Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                    .frame(width: 90.0, height: 90.0)
                   Button(action: {}){
                             Image("Planning Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                    .frame(width: 90.0, height: 90.0)
              }
              HStack (alignment: .top, spacing: 50){
                   Button(action: {}){
                             Image("Workspace Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                        .frame(width: 90.0, height: 90.0)
                   Button(action: {}){
                             Image("Homework Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                    .frame(width: 90.0, height: 90.0)
                   Button(action: {}){
                             Image("Message Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                    .frame(width: 90.0, height: 90.0)
              }
              HStack (alignment: .top, spacing: 50){
                   Button(action: {}){
                             Image("File Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                        .frame(width: 90.0, height: 90.0)
                   Button(action: {}){
                             Image("Homework Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                    .frame(width: 90.0, height: 90.0)
                   Button(action: {}){
                             Image("Message Button").scaleEffect(0.4)
                       
                   }.shadow(radius: 5)
                    .frame(width: 90.0, height: 90.0)
              }
         }

              
    }
}
struct Home_View_Previews: PreviewProvider {
    static var previews: some View {
        Home_View()
    }
}
