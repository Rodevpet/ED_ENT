//
//  TaskManager.swift
//  ED_ENT
//
//  Created by Robin PETIT on 19/05/2023.
//

import Foundation
class MyTaskManager {

    static let sessionManager: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // seconds
        configuration.timeoutIntervalForResource = 30 // seconds
        return URLSession(configuration: configuration)
    }()

    func postMyData(url:URLRequest) {
        dataTask = MyTaskManager.sessionManager.dataTask(with: url) { data, response, error in
            print("Ok")
        }
        dataTask.resume()
    }


    func getMyData(url:URLRequest) {
        dataTask = sessionManager.dataTask(with: url) { data, response, error in
            print("Ok")
        }
        dataTask.resume()
    }
}
