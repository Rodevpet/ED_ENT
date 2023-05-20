//
//  Json_Struct.swift
//  ED_ENT
//
//  Created by Robin PETIT on 22/03/2023.
//

import Foundation
import UIKit

struct LoginDataStruct_root: Decodable {
    let code: Int
    let token: String
    let message: String
    let data:LoginDataStruct_data?
}

struct LoginDataStruct_data: Decodable {
    let changementMDP: Bool
    let accounts:[LoginDataStruct_accounts]
}

struct LoginDataStruct_accounts: Decodable{
    let id: Int
    let identifiant: String
    let typeCompte: String
    let prenom: String
    let nom: String
    let email: String
    let anneeScolaireCourante: String
    let nomEtablissement: String
    let profile: LoginDataStruct_profile
    let modules:[LoginDataStruct_modules]
}


struct LoginDataStruct_modules: Decodable{
    let code: String
    let enable: Bool
    let ordre: Int
    let badge: Int
}

struct LoginDataStruct_profile: Decodable{
    let sexe:String
    let classe:LoginDataStruct_classe
    let photo:String
}

struct LoginDataStruct_classe: Decodable{
    let code:String
}
