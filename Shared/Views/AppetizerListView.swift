//
//  AppetizerListView.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 20/02/2021.
//

import SwiftUI

struct AppetizerListView: View {
    @Binding var appetizersArray: [Appetizer]
    var body: some View {
        NavigationView {
            List(appetizersArray) { appetizer in
                AppetizerListCell(appetizerName: appetizer.name,
                                  appetizerPrice: appetizer.price)
            }
            .navigationTitle("Appetizers")
        }
        
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView(appetizersArray: .constant(MockData.Appetizers))
    }
}
