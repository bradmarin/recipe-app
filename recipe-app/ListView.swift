//
//  ListView.swift
//  recipe-app
//
//  Created by Brad on 5/6/21.
//

import SwiftUI

struct ListView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                
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
