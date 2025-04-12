//
//  ContentView.swift
//  GroceryProject
//
//  Created by Daniel Tsivkovski on 4/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var groceryList: GroceryList = GroceryList(groceries: [])
    @State var stackPath = NavigationPath();
    
    var body: some View {
        VStack {
            NavigationStack (path: $stackPath) {
                List {
                    ForEach(groceryList.groceries) { grocery in
                        // adds a navigation link for each grocery
                        NavigationLink(value: grocery) {
                            GroceryListRow(grocery: grocery)
                        }
                    }
                    .onMove(perform: moveItems)
                    .onDelete(perform: deleteItems)
                }
                .navigationDestination(for: GroceryItem.self) {
                    grocery in GroceryDetail(grocery: grocery)
                }
                .navigationDestination(for: String.self) {
                    _ in AddGroceryItem(groceryList: groceryList, path: $stackPath)
                }
                .navigationTitle("My Groceries")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(value: "Add Grocery") {
                            Image(systemName: "plus.circle")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        groceryList.groceries.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        groceryList.groceries.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct GroceryListRow: View {
    var grocery: GroceryItem;
    var body: some View {
        // image with the grocery's selected imagename
        Image(systemName: grocery.imageName ?? "carrot.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 45)
            .foregroundStyle(grocery.perishable ? .red : .blue) // red accent color if perishable, blue if not
        Text(grocery.name) // grocery name
    }
}

#Preview {
    ContentView()
}
