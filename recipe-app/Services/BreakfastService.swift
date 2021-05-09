//
//  BreakfastService.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import Foundation

class BreakfastService {
    func getBreakfast(_ completion: @escaping (Result<[Breakfast], Error>) -> ()) {
        let url = URL(string: "http://www.recipepuppy.com/api/?q=breakfast")!
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            }
            
            do {
                let response = try JSONDecoder().decode(BreakfastResponses.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
