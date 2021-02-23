//
//  AppetizerViewModel.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 23/02/2021.
//

import SwiftUI

final class AppetizerViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let appetizers):
                DispatchQueue.main.async { self.appetizers = appetizers }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
