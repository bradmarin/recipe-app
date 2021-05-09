//
//  BreakfastViewModel.swift
//  recipe-app
//
//  Created by Brad on 5/8/21.
//

import Foundation

class BreakfastViewModel: ObservableObject {
    @Published var breakfasts = [Breakfast]()
    
    private let service = BreakfastService()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        service.getBreakfast{ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let breakfasts):
                    self?.breakfasts = breakfasts
                }
            }
        }
    }
}
