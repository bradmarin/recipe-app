//
//  Dinner.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import Foundation

struct DinnerResponses: Codable {
    let title: String
    let version: Double
    let href: String
    let results: [Dinner]
}

struct Dinner: Codable {
    
    let title, href, ingredients: String
    
    var detail: URL {
        URL(string: href)!
    }
}
