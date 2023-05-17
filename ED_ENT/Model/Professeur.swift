//
//  Professeur.swift
//  ED_ENT
//
//  Created by Robin PETIT on 16/05/2023.
//

import Foundation

class Professeur{
    let id:Int
    let nom:String
    
    init (id:Int, nom:String){
        self.id = id
        self.nom = nom
    }
    
    func getId() -> Int {
        return id
    }
    
    func getNom() -> String{
        return nom
    }
}
