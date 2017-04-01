//
//  HttpRequester.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum HttpError: Error {
    case api(String)
}

class HttpRequester {
    var delegate: HttpRequesterDelegate?
    
    func getData(fromUrl urlString: String, withCompletionHandler completionHandler: @escaping (Data) -> Void){
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            completionHandler(data!)
        }
        
        dataTask.resume()
    }

    
    
    func send(withMethod method: HttpMethod,
              toUrl urlString: String,
              withBody bodyDict: Dictionary<String, Any>? = nil,
              andHeaders headers: Dictionary<String, String> = [:]) {
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = method.rawValue
        
        if(bodyDict != nil) {
            do {
                let body = try JSONSerialization.data(withJSONObject: bodyDict!, options: .prettyPrinted)
                request.httpBody = body
            } catch {
            }
        }
        
        headers.forEach() { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        weak var weakSelf = self
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler:
            { bodyData, response, error in
                do {
                    let body = try JSONSerialization.jsonObject(with: bodyData!, options: .allowFragments)
                    
                    if((response as! HTTPURLResponse).statusCode >= 400) {
                        let message = (body as! Dictionary<String, Any>)["error"] as! String
                        weakSelf?.delegate?.didReceiveError(error: .api(message))
                        return
                    }
                    
                    switch(method) {
                    case .delete:
                        weakSelf?.delegate?.didDeleteData()
                    default:
                        weakSelf?.delegate?.didReceive(data: body)
                    }
                }
                catch {
                    weakSelf?.delegate?.didReceiveError(error: .api(error.localizedDescription))
                }
        })
        
        dataTask.resume()
    }
    
    func get(fromUrl urlString: String, andHeaders headers: Dictionary<String, String> = [:]){
        self.send(withMethod: .get, toUrl: urlString,withBody: nil, andHeaders: headers)
    }
    
    func post(toUrl urlString: String, withBody bodyDict: Dictionary<String, Any>, andHeaders headers: Dictionary<String, String> = [:]){
        self.send(withMethod: .post, toUrl: urlString, withBody: bodyDict, andHeaders: headers)
    }
    
    func delete(atUrl urlString: String, withHeaders headers: Dictionary<String, String> = [:]) {
        self.send(withMethod: .delete, toUrl: urlString, andHeaders: headers)
    }
    
    func postJson(toUrl urlString: String, withBody bodyDict: Dictionary<String, Any>, andHeaders headers: Dictionary<String, String> = [:]){
        var headersWithJson: Dictionary<String,String> = [:]
        headers.forEach(){ headersWithJson[$0.key] = $0.value }
        headersWithJson["Content-Type"] = "application/json"
        self.post(toUrl: urlString, withBody: bodyDict, andHeaders: headersWithJson)
    }
}
