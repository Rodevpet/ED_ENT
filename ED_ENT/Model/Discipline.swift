//
//  Discipline.swift
//  ED_ENT
//
//  Created by Robin PETIT on 17/05/2023.
//

import Foundation

class Discipline{
    let id:Int
    let codeMatiere:String
    let discipline:String
    let moyenne:String
    let moyennecClasse:String
    let moyenneMin:String
    let moyenneMax:String
    let effectif:Int
    let rang:Int
    let professeurs:Professeur
    let appreciations:[String]
    
    init(id: Int, codeMatiere: String, discipline: String, moyenne: String, moyennecClasse: String, moyenneMin: String, moyenneMax: String, effectif: Int, rang: Int, professeurs: Professeur, appreciations: [String]) {
        self.id = id
        self.codeMatiere = codeMatiere
        self.discipline = discipline
        self.moyenne = moyenne
        self.moyennecClasse = moyennecClasse
        self.moyenneMin = moyenneMin
        self.moyenneMax = moyenneMax
        self.effectif = effectif
        self.rang = rang
        self.professeurs = professeurs
        self.appreciations = appreciations
    }
}
