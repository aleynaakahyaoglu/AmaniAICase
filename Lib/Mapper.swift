//
//  Mapper.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation

class Mapper {
    
    static func map<S:Encodable,O:Decodable>(source:S,type:O.Type) -> O? {
        
        do {
            let data = try JSONEncoder().encode(source)
            
            
            
            let output = try JSONDecoder().decode(type, from: data)
            return output
        }
        catch {
            print("mapper error : (source.self) to (O.self) (error)")
            return nil
        }
    }
}
