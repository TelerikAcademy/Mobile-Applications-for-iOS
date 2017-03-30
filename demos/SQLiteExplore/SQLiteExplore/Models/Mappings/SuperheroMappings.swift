//
//  SuperheroMappings.swift
//  SQLiteExplore
//
//  Created by Doncho Minkov on 3/28/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation
import SQLite

let idExpression = Expression<Int64>("id")
let nameExpression = Expression<String>("name")
let secretIdentityExpression = Expression<String>("secretIdentity")

extension Superhero {
    public static func getIdExpression() -> Expression<Int64> {
        return idExpression
    }
    
    public static func getNameExpression() -> Expression<String> {
        return nameExpression
    }
    public static func getSecretIdentityExpression() -> Expression<String> {
        return secretIdentityExpression
    }
    
    convenience init(withRow row: Row) {
        let id: Int64 = row[idExpression]
        let name = row[nameExpression]
        let secretIdentity = row[secretIdentityExpression]
        self.init(withId: id, name: name, andSecretIdentity: secretIdentity)
    }
}
