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

class BuilderProfesseur{
    private var id:Int?
    private var nom:String?
    
    func setId(id:Int) -> BuilderProfesseur{
        self.id = id
        return self
    }
    
    func setNom (nom:String) -> BuilderProfesseur{
        self.nom = nom
        return self
    }
    
    func Verification(){
        guard self.nom != nil else{
            print ("nom : Error, value undefined")
            return
        }
        
        guard self.id != nil else{
            print ("id : Error, value undefined")
            return
        }
    }
    
    func Build() -> Professeur{
        return Professeur(id: self.id!, nom: self.nom!)
    }
}
