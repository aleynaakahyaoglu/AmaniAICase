//
//  Observerble.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation

class Observable<T> {
    init( _ value : T?) {
        self.value = value
    }
    
    var value : T? {
        didSet {
            callback?(value)
        }
    }
    
    private var callback : ((T?) -> ())?
    func bind( callback: @escaping(T?) -> ()) {
        callback(value)
        self.callback = callback
    }
}
