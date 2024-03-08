//
//  ApiManager.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import Foundation
import Alamofire


class ApiManager {
    func getPeople(completion: @escaping ([PersonDTO]?) -> ()) {
        guard let url = URL(string: "https://gist.githubusercontent.com/zekierciyas/48e744272a0aad671173409211ed716c/raw/de31c073f35250fa41022dd0a8422cf60758c4e9/images") else {
            completion(nil)
            return
        }
        guard let request = try? URLRequest(url: url, method:.get) else {
            completion(nil)
            return
        }
        AF.request(request).validate(statusCode: 200..<300).response{ response in
            if let data = response.data{
                let decoder = JSONDecoder()
                if let container = try? decoder.decode(PeopleContainerDTO.self, from: data) {
                    completion(container.images)
                    
                }else{
                    completion(nil)
                    
                }
            }
            
        }
        
    }
}
