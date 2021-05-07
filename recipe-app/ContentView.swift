//
//  ContentView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0;
    var body: some View {
        TabView (selection: $selection) {
            ListView()
                .tabItem {
                    VStack(alignment: .center, spacing: nil, content: {
                        Image(systemName: "list.bullet")
                        Text("Recipes")
                    })
                }
                .tag(0)
            FavoriteView()
                .tabItem {
                    VStack(alignment: .center, spacing: nil, content: {
                        Image(systemName: "suit.heart.fill")
                        Text("Favorites")
                    })
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
