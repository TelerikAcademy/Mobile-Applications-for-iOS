//
//  SuperheroesData.swift
//  SQLiteExplore
//
//  Created by Doncho Minkov on 3/27/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation
import SQLite

class SuperheroesData : BaseSuperheroesData {
    var delegate: SuperheroesDataDelegate?
    
    var db: Connection?
    var superheroesTable: Table?
    
    init(withPath path: String) {
        do {
            self.db = try Connection(path)
            self.superheroesTable = Table("superheroes")
            self.initDb();
        }
        catch let error as NSError {
            print("Error: \(error.userInfo)")
        }
    }
    
    func initDb() {
        do {
            try self.db?.run((self.superheroesTable?.create {table in
                table.column(Superhero.getIdExpression(), primaryKey: true)
                table.column(Superhero.getNameExpression(), unique: true)
                table.column(Superhero.getSecretIdentityExpression())
                })!)
        } catch let error as NSError {
            print("Error: \(error.userInfo)")
        }
    }
    
    func getAll() {
        do{
            let dbSuperheroes = try db?.prepare(self.superheroesTable!)
            let superheroModels = dbSuperheroes?.map() {Superhero(withRow: $0)}
            self.delegate?.didGetAll(superheroes: superheroModels!)
        } catch let error as NSError {
            print("Error: \(error.userInfo)")
        }
    }
    
    func create(superhero: Superhero) throws {
        try self.createMany(superheroes: [superhero])
    }
    
    func createMany(superheroes: [Superhero]) throws {
        //        superheroesToInsert.forEach() { superhero in
        try superheroes.forEach() { superhero in
            let insert = self.superheroesTable?.insert(Superhero.getNameExpression() <- superhero.name!,
                                                       Superhero.getSecretIdentityExpression() <- superhero.secretIdentity!)
            let result = try db?.run(insert!)
//            delegate.didCreate(result)
            print(result!)
        }
        
    }
}
