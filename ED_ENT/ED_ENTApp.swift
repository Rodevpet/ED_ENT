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
    @ObservedObject var code:Login = try! Login()
    var body: some Scene {
        WindowGroup {
            if (code.state != 200){
                Login_View(request:code)
            }
            if (self.code.state == 200){
                Home_View()
            }
        }
    }
}
