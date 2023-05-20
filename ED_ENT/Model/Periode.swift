//
//  Periode.swift
//  ED_ENT
//
//  Created by Robin PETIT on 15/05/2023.
//

import Foundation

class Periode{
    let idPeriode:String
    let codePeriode:String
    let periode:String
    let dateDebut:Date
    let dateFin:Date
    let cloture:Bool
    let FormatDate = DateFormatter()
    let Ensemble_Matiere:EnsembleMatiere
    let Discipline:[Discipline]
    
    init(idPeriode:String, codePeriode:String,periode:String, dateDebut:Date, dateFin:Date, cloture:Bool, Ensemble_Matiere:EnsembleMatiere, Discipline:[Discipline]){
        self.idPeriode = idPeriode
        self.periode = periode
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.cloture = cloture
        self.Ensemble_Matiere = Ensemble_Matiere
        self.Discipline = Discipline
        self.codePeriode = codePeriode
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

class BuilderPeriode{
    private var idPeriode:String?
    private var codePeriode:String?
    private var periode:String?
    private var dateDebut:Date?
    private var dateFin:Date?
    private var cloture:Bool?
    private var FormatDate = DateFormatter()
    private var Ensemble_Matiere:EnsembleMatiere?
    private var Discipline:[Discipline] = []

    func setIdPeriode(id:String) -> BuilderPeriode{
        self.idPeriode=id
        return self
    }
    
    func setCodePeriode(codePeriode:String) -> BuilderPeriode{
        self.codePeriode = codePeriode
        return self
    }

    func setPeriode (periode:String) -> BuilderPeriode{
        self.periode=periode
        return self
    }
    
    func setDateDebut (dateDebut:String) -> BuilderPeriode{
        let FormatDate = DateFormatter()
        FormatDate.dateFormat = "yyyy-MM-dd"
        self.dateDebut = FormatDate.date(from: dateDebut)
        return self
    }
    
    func setDateFin (dateFin:String) -> BuilderPeriode{
        let FormatDate = DateFormatter()
        FormatDate.dateFormat = "yyyy-MM-dd"
        self.dateFin = FormatDate.date(from: dateFin)
        return self
    }
    
    func setCloture (cloture:Bool) -> BuilderPeriode{
        self.cloture = cloture
        return self
    }
    
    func setEnsembleMatiere (Ensemble_Matiere:EnsembleMatiere) -> BuilderPeriode{
        self.Ensemble_Matiere = Ensemble_Matiere
        return self
    }
    
    func appendDiscipline (discipline:Discipline) -> BuilderPeriode {
        self.Discipline.append(discipline)
        return self
    }
    
    func Verification (){
        guard self.idPeriode != nil else{
            print ("idPeriode : Error, value undefined")
            return
        }
        
        guard self.codePeriode != nil else{
            print ("codePeriode : Error, value undefined")
            return
        }
        
        guard self.periode != nil else{
            print ("periode : Error, value undefined")
            return
        }
        
        guard self.dateDebut != nil else{
            print ("dateDebut : Error, value undefined")
            return
        }
        
        guard self.dateFin != nil else{
            print ("dateFin : Error, value undefined")
            return
        }
        
        guard self.cloture != nil else{
            print ("cloture : Error, value undefined")
            return
        }
        
        guard self.Ensemble_Matiere != nil else{
            print ("Ensemble_Matiere : Error, value undefined")
            return
        }
        guard self.Discipline != nil else{
            print ("Discipline : Error, value undefined")
            return
        }
    }
    
    func Build() -> Periode{
        return Periode(idPeriode: idPeriode!,codePeriode: self.codePeriode!, periode: self.periode!, dateDebut: self.dateDebut!, dateFin: self.dateFin!, cloture: self.cloture!, Ensemble_Matiere: self.Ensemble_Matiere!, Discipline: self.Discipline)
    }
}
