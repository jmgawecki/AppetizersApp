//
//  AppetizerListCell.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 20/02/2021.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizerName: String
    var appetizerPrice: Double
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizerName)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("\(appetizerPrice, specifier: "%.2f")$")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizerName: "Name", appetizerPrice: 32)
    }
}
