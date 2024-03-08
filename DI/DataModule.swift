//
//  DataModule.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation
import Resolver

class DataModule{
    static func initialize(){
        Resolver.register{ApiManager()}.scope(.shared)
        Resolver.register{Repository()}.scope(.shared)
        Resolver.register{DatabaseManager()}.scope(.shared)
        Resolver.register{PeopleListViewModel()}.scope(.graph)
        Resolver.register{DetailsViewModel()}.scope(.graph)

        
    }
}
