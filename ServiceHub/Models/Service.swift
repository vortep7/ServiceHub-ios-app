//
//  Service.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import Foundation

struct Service: Decodable {
    let body: Body
    let status: Int
    
    struct Body: Decodable {
        let services: [ServiceItem]
        
        struct ServiceItem: Decodable {
            var name: String
            var description: String
            var link: String
            var icon_url: String
        }
    }
}



