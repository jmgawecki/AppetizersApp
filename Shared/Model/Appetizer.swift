//
//  Appetizer.swift
//  Appetizers (iOS)
//
//  Created by Jakub Gawecki on 20/02/2021.
//

import Foundation

struct Appetizer: Decodable {
    let id:             Int
    let name:           String
    let description:    String
    let price:          Double
    let imageURL:       String
    let calories:       Int
    let protein:        Int
    let carbs:          Int
}

struct AppetizerResponse {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 123,
                                           name: "Test Appetizer",
                                           description: "This is the description",
                                           price: 25.5,
                                           imageURL: "",
                                           calories: 1200,
                                           protein: 30,
                                           carbs: 60)
    static let Appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
