//
//  LunchView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct LunchView: View {
    @ObservedObject var viewModel = LunchViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.lunches, id: \.href) { lunch in
                NavigationLink (destination: LunchDetailView(lunch: lunch)) {
                    HStack{
                        VStack(alignment: .leading)  {
                            Text(lunch.title)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
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
