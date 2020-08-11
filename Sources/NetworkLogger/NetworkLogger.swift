//
//  NetworkLogger.swift
//  loggerTest
//
//  Created by Alin Baciu on 15/02/2020.
//  Copyright © 2020 Alin Baciu. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public class NL: NSObject {
    static public var serverIP = "https://127.0.0.1:8080"
    
    static public func log(_ items: Any..., separator: String = " ", terminator: String = "", tag: String = "") {
        var message = "\(Date().timeIntervalSince1970) - "
        print(items, separator: separator, terminator: terminator, to: &message)
        print(items, separator: separator, terminator: terminator)
        NL.sendRequest(message: message, tag: tag)
    }
    
    private static func sendRequest(message: String, tag: String) {
        let session = URLSession.shared
        let url = URL(string: NL.serverIP)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = Data(message.utf8)
        if !tag.isEmpty {
            request.setValue("[\(tag)]", forHTTPHeaderField: "tag")
        }
        let task = session.dataTask(with: request)
        task.resume()
    }
}
