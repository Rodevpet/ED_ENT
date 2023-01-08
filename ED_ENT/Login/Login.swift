//
//  Request.swift
//  Lycee_Pierre_Termier
//
//  Created by Robin PETIT on 14/11/2022.
//
import SwiftUI
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct Login_Info: Decodable {
    let code: Int
    let token: String
}



class Login : ObservableObject{
    @Published var state:Int = 0
    var log:Handling_Keychain
    init () throws{
        log = Handling_Keychain(server: "www.ecoledirecte.com")
        if (try log.ItemKeychainExist()){
            let credentials:Credentials = try log.SearchItem()
            try Login(ID:credentials.username,PSWD:credentials.password)
        }
    }
    func Login (ID : String,PSWD : String)throws{
        let parameters = "data={\"uuid\":\"\",\"identifiant\": \""+ID+"\",\"motdepasse\":\""+PSWD+"\", \"isReLogin\": false}"
        print ("paramets is "+parameters)
        let postData =  parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: "https://api.ecoledirecte.com/v3/login.awp?v=4.24.0")!,timeoutInterval: Double.infinity)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                let login:Login_Info = try! JSONDecoder().decode(Login_Info.self, from: data)
                DispatchQueue.main.async {
                    // update our UI
                    do{
                        if (login.code == 200){
                            if (try self.log.ItemKeychainExist()==false){
                                 try self.log.AddItem(account: ID, password: PSWD)
                            }
                        }
                    }catch let error {
                        print (error)
                    }
                    self.state = login.code
                }
            }
        }
        task.resume()
    }
}

