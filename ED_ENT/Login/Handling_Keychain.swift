//
//  Handling_Keychain.swift
//  ED_ENT
//
//  Created by Robin PETIT on 08/01/2023.
//

import Foundation

struct Credentials {
    var username : String
    var password : String
}

enum KeychainError: Error {
    case noAccount(msg:String)
    case noPassword(msg:String)
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

class Handling_Keychain{
    var server:String
    init (server:String){
        self.server = server
    }

    func ItemKeychainExist () throws -> Bool {
        let query:[String:Any] = [kSecClass as String: kSecClassInternetPassword,
                                kSecAttrServer as String: server,
                                kSecMatchLimit as String: kSecMatchLimitOne,
                                kSecReturnAttributes as String: true,
                                kSecReturnData as String: true]
        var item : CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status == errSecItemNotFound else {
            return true
        }
        return false
    }
    
    func AddItem (account:String, password:String) throws -> OSStatus{
        guard account != "" else{throw KeychainError.noAccount(msg: "account is empty")}
        guard password != "" else{throw KeychainError.noPassword(msg: "password is empty")}
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrAccount as String: account,
                                    kSecAttrServer as String: server,
                                    kSecValueData as String: password.data(using: String.Encoding.utf8)]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
        return status
    }
    
    func SearchItem () throws -> Credentials{
        let query:[String:Any] = [kSecClass as String: kSecClassInternetPassword,
                                kSecAttrServer as String: server,
                                kSecMatchLimit as String: kSecMatchLimitOne,
                                kSecReturnAttributes as String: true,
                                kSecReturnData as String: true]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound else { throw KeychainError.noPassword(msg: "Item not Found") }
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
        guard let existingItem = item as? [String : Any],
            let passwordData = existingItem[kSecValueData as String] as? Data,
            let password = String(data: passwordData, encoding: String.Encoding.utf8),
            let account = existingItem[kSecAttrAccount as String] as? String
        else {
            throw KeychainError.unexpectedPasswordData
        }
        return Credentials(username: account, password: password)
    }
}
