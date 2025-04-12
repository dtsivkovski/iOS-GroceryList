//
//  GroceryList.swift
//  GroceryProject
//
//  Created by Daniel Tsivkovski on 4/11/25.
//

import Foundation

@Observable class GroceryList : Identifiable {
    
    var groceries: [GroceryItem] // array of grocery items
    
    init(groceries: [GroceryItem] = []) {
        self.groceries = groceries // initialize with empty array
    }
}
