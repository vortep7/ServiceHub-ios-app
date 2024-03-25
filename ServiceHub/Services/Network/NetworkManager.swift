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
}

extension NetworkManager:NetworkService {
    public func fetchData(completion: @escaping (Result<Service,Error>) -> Void) {
        print("q")
        let request = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json")!
        print("have url")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("erro r")
            }
            guard let data = data
            else {
                print("no data")

                return}
            do {
                let json = try self.decoder.decode(Service.self, from: data)
                print("sss")
                completion(.success(json))
            } catch {
                print("last catch")
                completion(.failure(error))
            }
        }.resume()
    }
}
