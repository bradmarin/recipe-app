//
//  LunchDetailView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct LunchDetailView: View {
    var lunch: Lunch
    
    var body: some View {
        NavigationView {
            ScrollView  {
                VStack (alignment: .leading, spacing: 16) {
                    VStack (alignment: .leading, spacing: 8) {
                        Text(lunch.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(1)
                        HStack {
                            Text("Ingredients: ")
                                .fontWeight(.bold)
                                .padding(1)
                            Text(lunch.ingredients)
                        }
                        NavigationLink(destination: WebView(request: URLRequest(url: lunch.detail))) {
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
        .navigationBarTitle(Text(lunch.title), displayMode: .inline)
            .padding()
    }
}

struct LunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LunchDetailView(lunch: Lunch(title: "Test", href: "Test", ingredients: "Test"))
    }
}
