//
//  DiConfig.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import Swinject
import SwinjectStoryboard

class DiConfigHttp {
    public static func setup(container: Container){
        container.register(HttpRequesterBase.self){_ in HttpRequester() }
    }
}

let baseUrl = "http://localhost:3001/api"

class DiConfigData {
    public static func setup(container: Container){
        container.register(BooksData.self) { resolver in
            let data = BooksData()
            var httpRequester = resolver.resolve(HttpRequesterBase.self)
            httpRequester?.delegate = data
            
            data.httpRequester = httpRequester
            data.url = "\(baseUrl)/books"
            return data
        }
    }
}

class DiConfigControllers {
    public static func setup(container: Container){
        container.storyboardInitCompleted(MasterViewController.self) {r, c in
            let data = r.resolve(BooksData.self)
            data?.delegate = c
            c.data = data
        }
        
        container.storyboardInitCompleted(DetailsViewController.self) {r, c in
            let data = r.resolve(BooksData.self)
            data?.delegate = c
            c.data = data
        }
    }
}

extension SwinjectStoryboard {
    public static func setup() {
        DiConfigHttp.setup(container: defaultContainer)
        DiConfigData.setup(container: defaultContainer)
        DiConfigControllers.setup(container: defaultContainer)
    }
}
