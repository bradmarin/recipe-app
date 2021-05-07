//
//  RecipeViewModel.swift
//  recipe-app
//
//  Created by Brad on 5/6/21.
//

import Foundation

class RecipeViewModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var isLoading = false
    
    private let service = RecipeService()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        isLoading = true
        service.getRecipes{ [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
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
