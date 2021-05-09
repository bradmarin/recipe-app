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
                        Text("Quick Recipess")
                    })
                }
                .tag(0)
            BreakfastView()
                .tabItem {
                    VStack(alignment: .center, spacing: nil, content: {
                        Image(systemName: "sunrise.fill")
                        Text("Breakfast")
                    })
                }
                .tag(1)
            LunchView()
                .tabItem {
                    VStack(alignment: .center, spacing: nil, content: {
                        Image(systemName: "sun.max.fill")
                        Text("Lunch")
                    })
                }
                .tag(2)
            DinnerView()
                .tabItem {
                    VStack(alignment: .center, spacing: nil, content: {
                        Image(systemName: "sunset.fill")
                        Text("Dinner")
                    })
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
