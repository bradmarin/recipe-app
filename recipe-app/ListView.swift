//
//  ListView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.recipes, id: \.href) { recipe in
                NavigationLink (destination: RecipeDetailView(recipe: recipe)) {
                    HStack{
                        CachedImageView(recipe.thumb)
                            .mask(Circle())
                            .frame(width: 80)
                        VStack(alignment: .leading)  {
                            Text(recipe.title)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarTitle(Text("All Recipes"))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
