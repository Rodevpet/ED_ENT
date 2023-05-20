//
//  Note.swift
//  ED_ENT
//
//  Created by Robin PETIT on 17/05/2023.
//

import Foundation

enum NoteValeur:Float{
    // Chiffremet nombre premier
    case disp = 1.23456
    case Abs = 2.34567
    case NE = 3.45678
    case EA = 4.56789
}
class Note{
    let id:Int?
    let devoir:String
    let codePeriode:String
    let codeMatiere:String
    let libelleMatiere:String
    let typeDevoir:String
    let coef:Float
    let noteSur:Float
    let valeur:Float
    let nonSignificatif:Bool
    let date:Date
    let dateSaisie:Date
    let valeurisee:Bool
    let moyenneClasse:Float
    let minClasse:Float
    let maxClasse:Float
    
    init(id: Int, devoir: String, codePeriode: String, codeMatiere: String, libelleMatiere: String, typeDevoir: String, coef: Float, noteSur: Float, valeur: Float, nonSignificatif: Bool, date: Date, dateSaisie: Date, valeurisee: Bool, moyenneClasse: Float, minClasse: Float, maxClasse: Float) {
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
        self.moyenneClasse = moyenneClasse
        self.minClasse = minClasse
        self.maxClasse = maxClasse
    }
}

class BuilderNote{
    private var id:Int?
    private var devoir:String?
    private var codePeriode:String?
    private var codeMatiere:String?
    private var libelleMatiere:String?
    private var typeDevoir:String?
    private var coef:Float?
    private var noteSur:Float?
    private var valeur:Float?
    private var nonSignificatif:Bool?
    private var date:Date?
    private var dateSaisie:Date?
    private var valeurisee:Bool?
    private var moyenneClasse:Float?
    private var minClasse:Float?
    private var maxClasse:Float?
    
    func setId(id:Int) -> BuilderNote{
        self.id=id
        return self
    }
    
    func setDevoir(devoir:String) -> BuilderNote{
        self.devoir=devoir
        return self
    }
    
    func setCodePeriode(codePeriode:String) -> BuilderNote{
        self.codePeriode=codePeriode
        return self
    }
    
    func setCodeMatiere(codeMatiere:String) -> BuilderNote{
        self.codeMatiere=codeMatiere
        return self
    }
    
    func setLibelleMatiere(libelleMatiere:String) -> BuilderNote{
        self.libelleMatiere=libelleMatiere
        return self
    }
    
    func setTypeDevoir(typeDevoir:String) -> BuilderNote{
        self.typeDevoir=typeDevoir
        return self
    }
    
    func setCoef(coef:String) -> BuilderNote{
        self.coef=Float(coef)
        return self
    }
    
    func setNoteSur(noteSur:String) -> BuilderNote{
        self.noteSur=Float(noteSur.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func setValeur(valeur:String) -> BuilderNote{
        if (valeur.elementsEqual("Disp ")){
            self.valeur = NoteValeur.disp.rawValue
        }else if (valeur.elementsEqual("Abs ")){
            self.valeur = NoteValeur.Abs.rawValue
        }else if (valeur.elementsEqual("EA ")){
            self.valeur = NoteValeur.EA.rawValue
        }else if (valeur.elementsEqual("NE ")){
            self.valeur = NoteValeur.NE.rawValue
        }else {
            self.valeur=Float(valeur.replacingOccurrences(of: ",", with: "."))
        }
        return self
    }
    
    func setNonSignificatif(nonSignificatif:Bool) -> BuilderNote{
        self.nonSignificatif=nonSignificatif
        return self
    }
    
    func setDate(date:String) -> BuilderNote{
        let FormatDate = DateFormatter()
        FormatDate.dateFormat = "yyyy-MM-dd"
        self.date = FormatDate.date(from: date)
        return self
    }
    
    func setDateSaisie(dateSaisie:String) -> BuilderNote{
        let FormatDate = DateFormatter()
        FormatDate.dateFormat = "yyyy-MM-dd"
        self.dateSaisie = FormatDate.date(from: dateSaisie)
        return self
    }
    
    func setValeurisee(valeurisee:Bool) -> BuilderNote{
        self.valeurisee=valeurisee
        return self
    }
    
    func setMoyenneClasse(moyenneClasse:String) -> BuilderNote{
        self.moyenneClasse=Float(moyenneClasse.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func setMinClasse(minClasse:String) -> BuilderNote{
        self.minClasse=Float(minClasse.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func setMaxClasse(maxClasse:String) -> BuilderNote{
        self.maxClasse=Float(maxClasse.replacingOccurrences(of: ",", with: "."))
        return self
    }
    
    func Verification(){
        if (self.id == nil) {
            print ("id : Error, value undefined")
        }
        if (self.devoir == nil) {
            print ("devoir : Error, value undefined")
        }
        
        if (self.codePeriode == nil) {
            print ("codePeriode : Error, value undefined")
        }
        
        if (self.codeMatiere == nil) {
            print ("codeMatiere : Error, value undefined")
        }
        
        if (self.libelleMatiere == nil) {
            print ("libelleMatiere : Error, value undefined")
        }
        
        if (self.typeDevoir == nil) {
            print ("typeDevoir : Error, value undefined")
        }
        
        if (self.coef == nil){
            print ("coef : Error, value undefined")
        }
        
        if (self.noteSur == nil) {
            print ("noteSur : Error, value undefined")
        }
        
        if (self.valeur == nil){
            print ("valeur : Error, value undefined")
        }
        
        if (self.nonSignificatif == nil){
            print ("nonSignificatif : Error, value undefined")
        }
        
        if (self.date == nil) {
            print ("date : Error, value undefined")
        }
        
        if (self.dateSaisie == nil){
            print ("dateSaisie : Error, value undefined")
        }
        
        if (self.valeurisee == nil){
            print ("valeurisee : Error, value undefined")
        }
        
        if (self.moyenneClasse == nil){
            print ("moyenneClasse : Error, value undefined")
            print ("moyenneClasse maybe undefined due to a missing parameter in the json body response. The value -1.0 is provided to the variable self.moyenneClasse")
            self.moyenneClasse = -1.0
        }
        
        if(self.minClasse == nil){
            print ("minClasse : Error, value undefined")
            print ("minClasse maybe undefined due to a missing parameter in the json body response. The value -1.0 is provided to the variable self.minClasse")
            self.minClasse = -1.0
        }

        if (self.maxClasse == nil) {
            print ("maxClasse : Error, value undefined")
            print ("maxClasse maybe undefined due to a missing parameter in the json body response. The value -1.0 is provided to the variable self.maxClasse")
            self.maxClasse = -1.0
        }
    }
    
    func Build() -> Note{
        return Note(id: self.id!, devoir: self.devoir!, codePeriode: self.codePeriode!, codeMatiere: self.codeMatiere!, libelleMatiere: self.libelleMatiere!, typeDevoir: self.typeDevoir!, coef: self.coef!, noteSur: self.noteSur!, valeur: self.valeur!, nonSignificatif: self.nonSignificatif!, date: self.date!, dateSaisie: self.dateSaisie!, valeurisee: self.valeurisee!, moyenneClasse: self.moyenneClasse!, minClasse: self.minClasse!, maxClasse: self.maxClasse!)
    }
}
