//
//  LunchView.swift
//  recipe-app
//
//  Created by Brad on 5/8/21.
//

import SwiftUI

struct LunchView: View {
    var body: some View {
        NavigationView {
            List() {
                
            }
            .navigationBarTitle(Text("Lunch Recipes"))
        }
    }
}

struct LunchView_Previews: PreviewProvider {
    static var previews: some View {
        LunchView()
    }
}
