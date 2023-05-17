//
//  ET_ENTApp.swift
//  ET_ENT
//
//  Created by Rodevpet on 13/11/2022.
//

import SwiftUI
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

@main 
struct ED_ENTApp: App {
    public var myGlobal = 0
    @ObservedObject var code:Login = try! Login()
    var body: some Scene {
        WindowGroup {
            if (code.DATA.code != 200){
                LoginView(request:code)
            }
            if (code.DATA.code == 200){
                HomeView(DATA: code.DATA)
            }
        }
    }
}
