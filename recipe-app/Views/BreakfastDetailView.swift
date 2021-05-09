//
//  BreakfastDetailView.swift
//  recipe-app
//
//  Created by Brad on 5/8/21.
//

import SwiftUI

struct BreakfastDetailView: View {
    var breakfast: Breakfast
    var body: some View {
        NavigationView {
            ScrollView  {
                VStack (alignment: .leading, spacing: 16) {
                    VStack (alignment: .leading, spacing: 8) {
                        Text(breakfast.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(1)
                        HStack {
                            Text("Ingredients: ")
                                .fontWeight(.bold)
                                .padding(1)
                            Text(breakfast.ingredients)
                        }
                        NavigationLink(destination: WebView(request: URLRequest(url: breakfast.detail))) {
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
        .navigationBarTitle(Text(breakfast.title), displayMode: .inline)
            .padding()
    }
}

struct BreakfastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreakfastDetailView(breakfast: Breakfast(title: "Test", href: "Test", ingredients: "Test"))
    }
}
