//
//  DinnerDetailView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct DinnerDetailView: View {
    var dinner: Dinner
    
    var body: some View {
        NavigationView {
            ScrollView  {
                VStack (alignment: .leading, spacing: 16) {
                    VStack (alignment: .leading, spacing: 8) {
                        Text(dinner.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(1)
                        HStack {
                            Text("Ingredients: ")
                                .fontWeight(.bold)
                                .padding(1)
                            Text(dinner.ingredients)
                        }
                        NavigationLink(destination: WebView(request: URLRequest(url: dinner.detail))) {
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
        .navigationBarTitle(Text(dinner.title), displayMode: .inline)
            .padding()
    }
}

struct DinnerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DinnerDetailView(dinner: Dinner(title: "Title", href: "Title", ingredients: "Title"))
    }
}
