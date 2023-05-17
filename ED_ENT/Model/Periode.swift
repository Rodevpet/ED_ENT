//
//  Periode.swift
//  ED_ENT
//
//  Created by Robin PETIT on 15/05/2023.
//

import Foundation

class Periode{
    let idPeriode:String
    let periode:String
    let dateDebut:Date
    let dateFin:Date
    let cloture:Bool
    let FormatDate = DateFormatter()
    let Ensemble_Matiere:EnsembleMatiere
    init(idPeriode:String, periode:String, dateDebut:String, dateFin:String, cloture:Bool, Ensemble_Matiere:EnsembleMatiere){
        FormatDate.dateFormat = "yyyy-MM-dd"
        self.idPeriode = idPeriode
        self.periode = periode
        self.dateDebut = FormatDate.date(from: dateDebut)!
        self.dateFin = FormatDate.date(from: dateFin)!
        self.cloture = cloture
        self.Ensemble_Matiere = Ensemble_Matiere
    }
    
    // Getter
    func getIdPeriode() -> String {
        return idPeriode
    }
    
    func getPeriode() -> String{
        return periode
    }
    
    func getCloture() -> Bool{
        return cloture
    }
    
    func getDateDebut() -> Date{
        return dateDebut
    }
    
    func getDateFin() -> Date{
        return dateFin
    }
}
