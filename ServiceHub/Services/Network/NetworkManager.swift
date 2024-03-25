//
//  NetworkManager.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import Foundation


protocol NetworkService {
    func fetchData(completion: @escaping (Result<Service,Error>) -> Void)
}

class NetworkManager {
    public static let shared = NetworkManager()
    private init() {}
    private let decoder = JSONDecoder()
    
    private func createUrl() -> URL? {
        let tunnel = "https://"
        let server = "publicstorage.hb.bizmrg.com/"
        let endPoint = "sirius/result.json"
        
        let result = URL(string: tunnel + server + endPoint)
        return result
    }
}

extension NetworkManager:NetworkService {
    public func fetchData(completion: @escaping (Result<Service,Error>) -> Void) {
        let request = createUrl()!
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data
            else {
                return}
            do {
                let json = try self.decoder.decode(Service.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
