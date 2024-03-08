//
//  DetailsViewModel.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation
import Resolver

class DetailsViewModel{
    
    @LazyInjected var repository: Repository
    
    var person = Observable<Person>(nil)
    
    var personID : Int? {
        didSet{
            guard let personID = personID else{return}
            self.person.value = repository.getPerson(id: personID)
        }
    }
    
}


