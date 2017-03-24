//
//  HttpData.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

class HttpRequester : HttpRequesterBase {

    var delegate: HttpRequesterDelegate?
    
    func send(withMethod method: HttpMethod,
                toUrl urlString: String,
                withBody body: Any?,
                andHeaders headers:Dictionary<String, String> = [:]){
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = method.rawValue
        
        if(body != nil) {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body!, options: .prettyPrinted)
            } catch {
                // TODO: throw error
            }
        }
        
        headers.forEach() {request.setValue($0.value, forHTTPHeaderField: $0.key)}
        
        weak var weakSelf = self
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if(error != nil){
                // TODO: throw error
            }
            
            do {
//                let obj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                switch(method) {
                case .get:
                    weakSelf?.delegate?.didCompleteGet(result: data!)
                case .post:
                    weakSelf?.delegate?.didCompletePost(result: data!)
                }
            } catch {
                // TODO: throw error
            }
        }
        
        dataTask.resume()
    }
    
    func get(fromUrl urlString: String, withHeaders headers: Dictionary<String, String>?){
        let newHeaders = headers ?? [:]
        self.send(withMethod: .get, toUrl: urlString, withBody: nil, andHeaders: newHeaders)
    }
    
    func post(toUrl urlString: String, withBody body: Any, andHeaders headers: Dictionary<String, String>?){
        let newHeaders = headers ?? [:]
        self.send(withMethod: .post, toUrl: urlString, withBody: body, andHeaders: newHeaders)
    }
    
    func postJson(toUrl urlString: String, withBody body: Any, andHeaders headers: Dictionary<String, String>?){
        var headersWithJson = headers ?? [:]
        headersWithJson["Content-Type"] = "application/json"
        
        self.send(withMethod: .post, toUrl: urlString, withBody: body, andHeaders: headersWithJson)
    }
}
