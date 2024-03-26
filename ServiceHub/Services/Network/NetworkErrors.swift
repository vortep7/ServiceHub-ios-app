//
//  NetworkErrors.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import Foundation

enum NetworkErrors: Error {
    case invalidData
    case badURL
    case badResponse
    case defaultError
}
