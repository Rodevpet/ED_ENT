//
//  NotesController.swift
//  ED_ENT
//
//  Created by Robin PETIT on 08/05/2023.
//

import Foundation
class NotesController {
    var DATA:NotesDataStruct_root?
    init (XToken:String){
        let body = "data={\"anneeScolaire\":\"\"}"
        let postData =  body.data(using: .utf8)
        var request = URLRequest(url: URL(string: "https://api.ecoledirecte.com/v3/notes.awp?verbe=get&v=4.30.0")!,timeoutInterval: Double.infinity)
        request.addValue("image/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("EDENT/1.0", forHTTPHeaderField: "User-Agent")
        request.addValue(String(body.utf8.count), forHTTPHeaderField: "Content-Length")
        request.addValue("api.ecoledirecte.com", forHTTPHeaderField: "Host")
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue(XToken, forHTTPHeaderField: "X-Token")
        //Get response
        var task = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                guard let notes:NotesDataStruct_root = try? JSONDecoder().decode(NotesDataStruct_root.self, from: data)else{
                    try! JSONDecoder().decode(NotesDataStruct_root.self, from: data)
                    return
                }
                DispatchQueue.main.async {
                    self.DATA=notes
                }
            }
        }
        task.resume()
    }
}
