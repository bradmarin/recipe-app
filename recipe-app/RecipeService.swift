//
//  RecipeService.swift
//  recipe-app
//
//  Created by Brad on 5/6/21.
//

import Foundation

class RecipeService {
    func getRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> ()) {
        let url = URL(string: "http://www.recipepuppy.com/api")!
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            }
            
            do {
                let response = try JSONDecoder().decode(RecipesResponses.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
