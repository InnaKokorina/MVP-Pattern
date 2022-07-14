//
//  NetworkService.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 13.07.2022.
//

import Foundation
protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
       URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let decoder = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(decoder))
            } catch {
                completion(.failure(error))
            }
       }.resume()
    }   
}
