//
//  DinnerViewModel.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import Foundation

class DinnerViewModel: ObservableObject {
    @Published var dinners = [Dinner]()
    
    private let service = DinnerService()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        service.getDinner{ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let dinners):
                    self?.dinners = dinners
                }
            }
        }
    }
}
