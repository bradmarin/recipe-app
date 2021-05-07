//
//  ListView.swift
//  recipe-app
//
//  Created by Brad on 5/6/21.
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
                            HStack {
                                CachedImageView(recipe.thumb)
                                    .mask(Circle())
                                    .frame(width: 60)
                                VStack(alignment: .leading)  {
                                    Text(recipe.title)
                                        .font(.title)
                                        .lineLimit(2)
                                    Text(recipe.ingredients)
                                        .lineLimit(nil)
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
