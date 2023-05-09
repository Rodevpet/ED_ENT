//
//  Session_Data.swift
//  ED_ENT
//
//  Created by Robin PETIT on 02/04/2023.
//

import Foundation

class Session_Data{
    let Data:root
    init (Data:root){
        self.Data = Data
    }
    
    func get_Data () -> root{
        return Data
    }
}
