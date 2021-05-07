//
//  RecipeDetailView.swift
//  recipe-app
//
//  Created by Brad on 5/7/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var favorite = false
    
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
                            .font(.largeTitle)
                            .padding(1)
                        Text("Ingredients: \(recipe.ingredients)")
                            .padding(1)
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
        .toolbar {
            Toggle(isOn: $favorite, label: {
                
            })
            .padding()
            .toggleStyle(favoriteStyle())
        }
    }
}

struct favoriteStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "suit.heart.fill" : "suit.heart")
                .foregroundColor(configuration.isOn ? .red : .gray)
                .font(.system(size: 20, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(title: "Test", href: "Test", ingredients: "Test", thumbnail: "Test"))
    }
}


//WebView(request: URLRequest(url: recipe.detail))
