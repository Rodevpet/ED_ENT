//
//  Notes.swift
//  ED_ENT
//
//  Created by Robin PETIT on 02/05/2023.
//

import SwiftUI

struct Notes: View {
    let XToken:String
    let Statut:String
    let id:String
    let Controller:NotesController
    init (XToken:String,Statut:String,id:String){
        self.XToken = XToken
        self.Statut = Statut
        self.id = id
        Controller = NotesController(XToken:self.XToken,Statut: self.Statut,id:self.id)
    }
    var body: some View {
        ZStack {
            Color.black
            Circle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("Gradient1"),Color("Gradient2")]), startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 200,height: 200)
            Circle().frame(width: 150,height: 150)
                .foregroundColor(Color.black)
            Text("16.00")
                .font(.custom("GameOfSquids", fixedSize: 50))
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
    }
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
        Notes(XToken: "", Statut: "", id: "")
    }
}
