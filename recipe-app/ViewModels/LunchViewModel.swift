//
//  LunchViewModel.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import Foundation

class LunchViewModel: ObservableObject {
    @Published var lunches = [Lunch]()
    
    private let service = LunchService()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        service.getLunch{ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let lunches):
                    self?.lunches = lunches
                }
            }
        }
    }
}
