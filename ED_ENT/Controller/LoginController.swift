//
//  Request.swift
//  
//
//  Created by Rodevpet on 14/11/2022.
//
import SwiftUI
import Foundation
import UIKit
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif



class Login : ObservableObject{
    @Published var DATA:LoginDataStruct_root = LoginDataStruct_root(code: 0, token: "Empty", message: "Empty", data: LoginDataStruct_data(changementMDP: true, accounts: [LoginDataStruct_accounts(id: 0, identifiant: "Empty", prenom: "Empty", nom: "Empty", email: "Empty", anneeScolaireCourante: "Empty", nomEtablissement: "Empty",profile: (LoginDataStruct_profile(sexe: "ND", classe: LoginDataStruct_classe(code: "ND"), photo: "None")), modules: [LoginDataStruct_modules(code: "Empty", enable: false, ordre: 0, badge: 0)])]))
    var log:Handling_Keychain
    init () throws{
        log = Handling_Keychain(server: "www.ecoledirecte.com")
        if (try log.ItemKeychainExist()){
            let credentials:Credentials = try log.SearchItem()
            try Login(ID:credentials.username,PSWD:credentials.password)
        }
    }
    func Login (ID : String,PSWD : String)throws{
        //Request to www.ecoledirect.com
        let parameters = "data={\"uuid\":\"\",\"identifiant\": \""+ID+"\",\"motdepasse\":\""+PSWD+"\", \"isReLogin\": false}"
        let postData =  parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: "https://api.ecoledirecte.com/v3/login.awp?v=4.24.0")!,timeoutInterval: Double.infinity)
        request.addValue("image/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("EDENT/1.0", forHTTPHeaderField: "User-Agent")
        request.addValue(String(parameters.utf8.count), forHTTPHeaderField: "Content-Length")
        request.addValue("api.ecoledirecte.com", forHTTPHeaderField: "Host")
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        //Get response
        var task = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                guard let login:LoginDataStruct_root = try? JSONDecoder().decode(LoginDataStruct_root.self, from: data)else{
                    try! JSONDecoder().decode(LoginDataStruct_root.self, from: data)
                    return
                }
                DispatchQueue.main.async {
                    do{
                        if (login.code == 200){
                            if (try self.log.ItemKeychainExist()==false){
                                try self.log.AddItem(account: ID, password: PSWD)
                            }
                        }
                    }catch let error {
                        print (error)
                    }
                    self.DATA = login
                }
            }
        }
        task.resume()
    }
}
