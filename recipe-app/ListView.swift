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
        if viewModel.isLoading {
            return AnyView(ActivityIndicator(style: .medium))
        } else {
            return AnyView(
                NavigationView {
                    List(viewModel.recipes, id: \.href) { recipe in
                        NavigationLink(
                            destination: WebView(request: URLRequest(url: recipe.detail))) {
                            ZStack (alignment: .bottomLeading){
                                CachedImageView(recipe.thumb)
                                VStack(alignment: .leading)  {
                                    Text(recipe.title)
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .navigationBarTitle(Text("All Recipes"))
                }
            )
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
