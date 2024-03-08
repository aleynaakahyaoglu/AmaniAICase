//
//  PeopleListViewModel.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation
import Resolver

class PeopleListViewModel {
    
    @LazyInjected var repository: Repository
    
    var people = Observable<[Person]>(nil)
    
    func initialize() {

        repository.getPeople { entity in
            self.people.value = entity
            
        }
        
    }
    
}
