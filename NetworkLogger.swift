//
//  NetworkLogger.swift
//  loggerTest
//
//  Created by Alin Baciu on 15/02/2020.
//  Copyright © 2020 Alin Baciu. All rights reserved.
//

import UIKit

let serverIP = "127.0.0.1:8080"

class NL: NSObject {
    static func log(_ items: Any..., separator: String = " ", terminator: String = "") {
        var message = "\(Date().timeIntervalSince1970) - "
        print(items, separator: separator, terminator: terminator, to: &message)
        print(items, separator: separator, terminator: terminator)
        NL.sendRequest(message: message)
    }
    
    private static func sendRequest(message: String) {
        let session = URLSession.shared
        let url = URL(string: "http://\(serverIP)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = Data(message.utf8)
        let task = session.dataTask(with: request)
        task.resume()
    }
}
