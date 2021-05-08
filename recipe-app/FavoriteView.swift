//
//  FavoriteView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.recipes, id: \.href) { recipe in
                Text("Test")
            }
            .navigationBarTitle(Text("Favorites"))
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
