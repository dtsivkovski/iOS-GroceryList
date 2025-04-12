//
//  Grocery.swift
//  GroceryProject
//
//  Created by Daniel Tsivkovski on 4/11/25.
//

import Foundation

struct GroceryItem : Codable, Identifiable, Hashable {
    var id: String;
    var name: String;
    var description: String;
    var perishable: Bool;
    var quantity: Double;
    var imageName: String?;
}
