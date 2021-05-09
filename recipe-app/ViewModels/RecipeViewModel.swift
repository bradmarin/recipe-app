//
//  RecipeViewModel.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import Foundation

class RecipeViewModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    private let service = RecipeService()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        service.getRecipes{ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let recipes):
                    self?.recipes = recipes
                }
            }
        }
    }
    
    
}
