//
//  Json_Struct_Notes.swift
//  ED_ENT
//
//  Created by Robin PETIT on 08/05/2023.
//

import Foundation
struct NotesDataStruct_root: Decodable {
    let code: Int
    let token: String
    let data:NotesDataStruct_data?
}

struct NotesDataStruct_data: Decodable {
    let periodes:[NotesDataStruct_periodes]
    let notes:[NotesDataStruct_notes]
}

struct NotesDataStruct_notes: Decodable{
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
}
struct NotesDataStruct_periodes: Decodable {
    let idPeriode:String
    let periode:String
    let dateDebut:String
    let dateFin:String
    let cloture:Bool
    let ensembleMatieres:NotesDataStruct_ensembleMatieres
}

struct NotesDataStruct_ensembleMatieres: Decodable{
    let nomPP:String
    let appreciationPP:String
    let disciplines:[NotesDataStruct_disciplines]
}

struct NotesDataStruct_disciplines: Decodable{
    let id:Int
    let codeMatiere:String
    let discipline:String
    let moyenne:String
    let moyennecClasse:String
    let moyenneMin:String
    let moyenneMax:String
    let effectif:Int
    let rang:Int
    let professeurs:[NotesDataStruct_professeurs]
    let appreciations:[String]
}

struct NotesDataStruct_professeurs: Decodable{
    let id:Int
    let nom:String
}
