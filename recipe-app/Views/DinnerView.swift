//
//  DinnerView.swift
//  recipe-app
//
//  Created by Brad on 5/8/21.
//

import SwiftUI

struct DinnerView: View {
    var body: some View {
        NavigationView {
            List() {
                
            }
            .navigationBarTitle(Text("Dinner Recipes"))
        }
    }
}

struct DinnerView_Previews: PreviewProvider {
    static var previews: some View {
        DinnerView()
    }
}
