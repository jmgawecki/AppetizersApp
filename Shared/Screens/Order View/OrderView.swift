//
//  OrderView.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 20/02/2021.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView {
            Text("Order View")
                .navigationTitle("Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
