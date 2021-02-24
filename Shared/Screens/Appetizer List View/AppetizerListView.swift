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
                    AppetizerListCell(appetizer: appetizer)
                }
                if viewModel.isLoadingView { AppetizerProgressView() }
            }
            .navigationTitle("Appetizers")
            .onAppear { viewModel.getAppetizers() }
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title:            alert.title,
                      message:          alert.message,
                      dismissButton:    alert.dismiss)
            }
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView(viewModel: AppetizerViewModel())
    }
}
