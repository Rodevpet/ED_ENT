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
    let moyenne:Float
    let moyennecClasse:Float
    let moyenneMin:Float
    let moyenneMax:Float
    let effectif:Int
    let rang:Int
    let professeurs:[Professeur]
    let appreciations:[String]
    var periode:Periode?
    var notes:[Note] = []
    init(id: Int, codeMatiere: String, discipline: String, moyenne: Float, moyennecClasse: Float, moyenneMin: Float, moyenneMax: Float, effectif: Int, rang: Int, professeurs: [Professeur], appreciations: [String],notes:[Note]) {
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
        self.notes = notes
    }
    
    func setPeriode(periode:Periode){
        self.periode=periode
    }
    
    func getPeriode() -> Periode{
        return self.periode!
    }
    
    func appendNote(note:Note){
        self.notes.append(note)
    }
}

class BuilderDiscipline{
    private var id:Int?
    private var codeMatiere:String?
    private var discipline:String?
    private var moyenne:Float?
    private var moyenneClasse:Float?
    private var moyenneMin:Float?
    private var moyenneMax:Float?
    private var effectif:Int?
    private var rang:Int?
    private var professeurs:[Professeur]?
    private var appreciations:[String] = []
    private var notes:[Note] = []

    func setId(id:Int) -> BuilderDiscipline{
        self.id=id
        return self
    }
    
    func setCodeMatiere(codeMatiere:String) -> BuilderDiscipline{
        self.codeMatiere=codeMatiere
        return self
    }
    
    func setDiscipline(discipline:String) -> BuilderDiscipline{
        self.discipline=discipline
        return self
    }
    
    func setMoyenne(moyenne:String) -> BuilderDiscipline{
        self.moyenne=Float(moyenne.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func setmoyenneClasse(moyenneClasse:String) -> BuilderDiscipline{
        self.moyenneClasse=Float(moyenneClasse.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func setMoyenneMin(moyenneMin:String) -> BuilderDiscipline{
        self.moyenneMin=Float(moyenneMin.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func setMoyenneMax(moyenneMax:String) -> BuilderDiscipline{
        self.moyenneMax=Float(moyenneMax.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func setEffectif(effectif:Int) -> BuilderDiscipline{
        self.effectif=effectif
        return self
    }
    
    func setRang(rang:Int) -> BuilderDiscipline{
        self.rang=rang
        return self
    }
    
    @discardableResult
    func setProfesseurs(professeurs:[Professeur]) -> BuilderDiscipline{
        self.professeurs=professeurs
        return self
    }
    
    func appendAppreciation(appreciation:String) -> BuilderDiscipline{
        self.appreciations.append(appreciation)
        return self
    }
    
    @discardableResult
    func appendNote(note:Note) -> BuilderDiscipline{
        self.notes.append(note)
        return self
    }

    func Verification(){
        if (self.moyenne == nil) {
            print ("moyenne : Error, value undefined")
            print ("moyenne maybe undefined due to a missing parameter in the json body response. The value -1.0 is provided to the variable self.moyenne")
            self.moyenne = -1.0
        }
        
        if (self.moyenneClasse == nil) {
            print ("moyenneClasse : Error, value undefined")
            print ("moyenneClasse maybe undefined due to a missing parameter in the json body response. The value -1.0 is provided to the variable self.moyenneClasse")
            self.moyenneClasse = -1.0
        }
        
        if (self.moyenneMin == nil) {
            print ("moyenneMin : Error, value undefined")
            print ("moyenneMin maybe undefined due to a missing parameter in the json body response. The value -1.0 is provided to the variable self.moyenneMin")
            self.moyenneMin = -1.0
        }
        
        if (self.moyenneMax == nil) {
            print ("moyenneMax : Error, value undefined")
            print ("moyenneMax maybe undefined due to a missing parameter in the json body response. The value -1.0 is provided to the variable self.moyenneMax")
            self.moyenneMax = -1.0
        }
        
        guard self.id != nil else{
            print ("idDiscipline : Error, value undefined")
            return
        }
        
        guard self.codeMatiere != nil else{
            print ("codeMatiere : Error, value undefined")
            return
        }
        
        guard self.discipline != nil else{
            print ("discipline : Error, value undefined")
            return
        }
        
        guard self.effectif != nil else{
            print ("effectif : Error, value undefined")
            return
        }
        
        guard self.rang != nil else{
            print ("rang : Error, value undefined")
            return
        }
        
        guard self.professeurs != nil else{
            print ("professeurs : Error, value undefined")
            return
        }
    }
    
    func Build() -> Discipline{
        return Discipline.init(id: self.id!, codeMatiere: self.codeMatiere!, discipline: self.discipline!, moyenne: self.moyenne!, moyennecClasse: self.moyenneClasse!, moyenneMin: self.moyenneMin!, moyenneMax: self.moyenneMax!, effectif: self.effectif!, rang: self.rang!, professeurs: self.professeurs!, appreciations: self.appreciations,notes: self.notes)
    }
}
