//
//  RecipeDetailView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        NavigationView {
            ScrollView  {
                VStack (alignment: .leading, spacing: 16) {
                    CachedImageView(recipe.thumb)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .padding()
                    VStack (alignment: .leading, spacing: 8) {
                        Text(recipe.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(1)
                        HStack {
                            Text("Ingredients: ")
                                .fontWeight(.bold)
                                .padding(1)
                            Text(recipe.ingredients)
                        }
                        NavigationLink(destination: WebView(request: URLRequest(url: recipe.detail))) {
                            Text("Recipe Instructions")
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(40)
                                .foregroundColor(.white)
                        }
                        .padding(1)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle(Text(recipe.title), displayMode: .inline)
            .padding()
        }
    }

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(title: "Test", href: "Test", ingredients: "Test", thumbnail: "Test"))
    }
}


//WebView(request: URLRequest(url: recipe.detail))
