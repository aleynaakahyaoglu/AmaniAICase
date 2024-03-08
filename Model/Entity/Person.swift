//
//  Person.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation
import Resolver
import RealmSwift

class Person: Object, Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id, desc = "description", base64, title
    }
    
    @Persisted(primaryKey: true) var id: Int
    @Persisted var desc: String?
    @Persisted var base64: String?
    @Persisted var title: String?
    
}
