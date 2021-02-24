//
//  Alert.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 23/02/2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismiss: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title:      Text("invalidData"),
                                            message:    Text("test"),
                                            dismiss:    .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title:      Text("invalidResponse"),
                                            message:    Text("test"),
                                            dismiss:    .default(Text("Ok")))
    
    static let invalidUrl       = AlertItem(title:      Text("invalidUrl"),
                                            message:    Text("test"),
                                            dismiss:    .default(Text("Ok")))
    
    static let UnableToComplete = AlertItem(title:      Text("UnableToComplete"),
                                            message:    Text("test"),
                                            dismiss:    .default(Text("Ok")))
}
