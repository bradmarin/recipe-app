//
//  BreakfastView.swift
//  recipe-app
//
//  Created by Brad on 5/8/21.
//

import SwiftUI

struct BreakfastView: View {
    @ObservedObject var viewModel = BreakfastViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.breakfasts, id: \.href) { breakfast in
                NavigationLink (destination: BreakfastDetailView(breakfast: breakfast)) {
                    HStack{
                        VStack(alignment: .leading)  {
                            Text(breakfast.title)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarTitle(Text("Breakfast Recipes"))
        }
    }
}

struct BreakfastView_Previews: PreviewProvider {
    static var previews: some View {
        BreakfastView()
    }
}
