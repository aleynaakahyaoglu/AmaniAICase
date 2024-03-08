//
//  PersonDTO.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation

struct PersonDTO: Codable {
    let id: Int
    let description: String?
    let base64: String?
    let title: String?
}
