//
//  AppetizerListView.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 20/02/2021.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.Appetizers) { appetizer in
                AppetizerListCell(appetizerName: appetizer.name,
                                  appetizerPrice: appetizer.price)
            }
            .navigationTitle("Appetizers")
        }
        
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
