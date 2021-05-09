//
//  DinnerView.swift
//  recipe-app
//
//  Created by Brad on 5/1/21.
//

import SwiftUI

struct DinnerView: View {
    @ObservedObject var viewModel = DinnerViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.dinners, id: \.href) { dinner in
                NavigationLink (destination: DinnerDetailView(dinner: dinner)) {
                    HStack{
                        VStack(alignment: .leading)  {
                            Text(dinner.title)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
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
