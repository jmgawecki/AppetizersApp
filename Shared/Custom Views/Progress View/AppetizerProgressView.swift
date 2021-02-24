//
//  AppetizerProgressView.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 24/02/2021.
//

import SwiftUI

struct AppetizerProgressView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).opacity(0.6).ignoresSafeArea()
            ProgressView()
                .accentColor(Color.green)
                .scaleEffect(2)
                .progressViewStyle(CircularProgressViewStyle(tint: Color("brandPrimary")))
        }
        
    }
}

struct AppetizerProgressView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerProgressView()
    }
}
