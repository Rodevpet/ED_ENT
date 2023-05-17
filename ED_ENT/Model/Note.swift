//
//  Note.swift
//  ED_ENT
//
//  Created by Robin PETIT on 17/05/2023.
//

import Foundation

class Note{
    let id:Int
    let devoir:String
    let codePeriode:String
    let codeMatiere:String
    let libelleMatiere:String
    let typeDevoir:String
    let coef:String
    let noteSur:String
    let valeur:String
    let nonSignificatif:Bool
    let date:String
    let dateSaisie:String
    let valeurisee:Bool
    let moyennecClasse:String
    let minClasse:String
    let maxClasse:String
    let matiere:Discipline
    let periode:Periode
    
    init(id: Int, devoir: String, codePeriode: String, codeMatiere: String, libelleMatiere: String, typeDevoir: String, coef: String, noteSur: String, valeur: String, nonSignificatif: Bool, date: String, dateSaisie: String, valeurisee: Bool, moyennecClasse: String, minClasse: String, maxClasse: String,matiere:Discipline, periode:Periode) {
        self.id = id
        self.devoir = devoir
        self.codePeriode = codePeriode
        self.codeMatiere = codeMatiere
        self.libelleMatiere = libelleMatiere
        self.typeDevoir = typeDevoir
        self.coef = coef
        self.noteSur = noteSur
        self.valeur = valeur
        self.nonSignificatif = nonSignificatif
        self.date = date
        self.dateSaisie = dateSaisie
        self.valeurisee = valeurisee
        self.moyennecClasse = moyennecClasse
        self.minClasse = minClasse
        self.maxClasse = maxClasse
        self.matiere = matiere
        self.periode = periode
    }
}
