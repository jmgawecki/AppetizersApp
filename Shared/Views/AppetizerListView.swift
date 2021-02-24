//
//  AppetizerListView.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 20/02/2021.
//

import SwiftUI

struct AppetizerListView: View {
    @ObservedObject var viewModel: AppetizerViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizerName: appetizer.name,
                                      appetizerPrice: appetizer.price)
                }
                if viewModel.isLoadingView { AppetizerProgressView() }
            }
            .navigationTitle("Appetizers")
            .onAppear(perform: {
                viewModel.getAppetizers()
            })
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView(viewModel: AppetizerViewModel())
    }
}
