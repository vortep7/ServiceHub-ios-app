//
//  NetworkManager.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import Foundation

protocol NetworkService {
    func fetchData() async throws -> Service
}

class NetworkManager {
    
    static let shared = NetworkManager()
    let decoder = JSONDecoder()
    
    func createUrl() -> URL? {
        return URL(string: "")
    }
    
}

extension NetworkManager: NetworkService {
    
    func fetchData() async throws -> Service {
        
        guard let url = createUrl() else {
            throw NetworkErrors.badURL
        }
        
        let response = try await URLSession.shared.data(from: url)
        
        do {
            let json = try decoder.decode(Service.self, from: response.0)
            return json
        } catch {
            throw NetworkErrors.invalidData
        }
    }
    
}
