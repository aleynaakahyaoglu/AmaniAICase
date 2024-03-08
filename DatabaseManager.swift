//
//  DatabaseManager.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    func setPeople(people:[Person]?) {
        if let realm = try? Realm() {
            try? realm.write {
                realm.delete(realm.objects(Person.self))
                
                realm.add(people ?? [])
            }
        }
        
    }
    func getPerson(id: Int) -> Person? {
        return try? Realm().object(ofType: Person.self, forPrimaryKey: id)?.detached()

    }
}


protocol RealmListDetachable {
    
    func detached() -> Self
}

extension List: RealmListDetachable where Element: Object {
    
    func detached() -> List<Element> {
        let detached = self.detached
        let result = List<Element>()
        result.append(objectsIn: detached)
        return result
    }
    
}

@objc extension Object {
    
    public func detached() -> Self {
        let detached = type(of: self).init()
        for property in objectSchema.properties {
            //guard property != objectSchema.primaryKeyProperty, let value = value(forKey: property.name) else { continue }
            guard let value = value(forKey: property.name) else { continue }
            if let detachable = value as? Object {
                detached.setValue(detachable.detached(), forKey: property.name)
            } else if let list = value as? RealmListDetachable {
                detached.setValue(list.detached(), forKey: property.name)
            } else {
                detached.setValue(value, forKey: property.name)
            }
        }
        return detached
    }
}

extension Sequence where Iterator.Element: Object {
    
    public var detached: [Element] {
        return self.map({ $0.detached() })
    }
    
}
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}
