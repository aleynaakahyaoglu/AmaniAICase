//
//  Repository.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation
import Resolver

class Repository {
    
    @Injected var apiManager: ApiManager
    @Injected var databaseManager: DatabaseManager
    
    func getPeople(completion: @escaping ([Person]?) -> ()) {
        apiManager.getPeople { dto in
            let entity = Mapper.map(source: dto , type: [Person].self)
            self.databaseManager.setPeople(people: entity)
            completion(entity?.detached)
            
        }
    }
    
    func getPerson(id:Int)->Person? {
        return databaseManager.getPerson(id: id)?.detached()
        
    }
    
}
