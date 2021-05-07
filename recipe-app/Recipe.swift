//
//  Recipe.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import Foundation

struct RecipesResponses: Codable {
    let title: String
    let version: Double
    let href: String
    let results: [Recipe]
}

struct Recipe: Codable {
    
    
    let title, href, ingredients, thumbnail: String
    
    var detail:  URL {
        URL(string: href)!
    }
    
    var thumb:  URL {
        URL(string: thumbnail)!
    }
}
