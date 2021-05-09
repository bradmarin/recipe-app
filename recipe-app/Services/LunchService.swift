//
//  LunchService.swift
//  recipe-app
//
//  Created by Brad on 5/8/21.
//

import Foundation

class LunchService {
    func getLunch(_ completion: @escaping (Result<[Lunch], Error>) -> ()) {
        let url = URL(string: "http://www.recipepuppy.com/api/?q=lunch")!
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            }
            
            do {
                let response = try JSONDecoder().decode(LunchResponses.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
