//
//  AppetizerViewModel.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 23/02/2021.
//

import SwiftUI

final class AppetizerViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    @Published var alertItem: AlertItem?
    
    @Published var isLoadingView: Bool = false
    
    func getAppetizers() {
        DispatchQueue.main.async { self.isLoadingView.toggle() }
        
        NetworkManager.shared.getAppetizers { [weak self]  (result) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoadingView.toggle()
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers 
                    
                case .failure(let error):
                    switch error {
                    case .invalidUsername:
                        self.alertItem = AlertContext.invalidUrl
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.UnableToComplete
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
}
