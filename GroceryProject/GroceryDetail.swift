//
//  GroceryDetail.swift
//  GroceryProject
//
//  Created by Daniel Tsivkovski on 4/11/25.
//

import SwiftUI

struct GroceryDetail: View {
    
    var grocery: GroceryItem;
    
    @State private var iconColor: Color = .blue;
    
    var body: some View {
        VStack {
            // shows the grocery image of choice
            Image(systemName: grocery.imageName ?? "carrot.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .foregroundStyle(iconColor)
                .frame(minWidth: 80, maxWidth: 160)
            // name and description
            Text(grocery.name).font(.title).bold().padding(.top, 20)
            Text(grocery.description).font(.title3).padding(.top, 10)
            // perishable or not
            HStack {
                Text("Perishable").font(.headline)
                Spacer()
                Image(systemName: grocery.perishable ? "checkmark.circle.fill" : "xmark.circle.fill")
            }.padding([.leading, .trailing], 20).padding(.top, 30)
            // quantity needed
            HStack {
                Text("Quantity Needed").font(.headline)
                Spacer()
                Text(grocery.quantity.formatted())
            }.padding([.leading, .trailing], 20).padding(.top, 30)
            // button to randomize color of the icon as a fun effet for the user
            VStack {
                Button(action: {
                    // creates a new random color for the icon
                    let r = Double.random(in: 0...1)
                    let g = Double.random(in: 0...1)
                    let b = Double.random(in: 0...1)
                    iconColor = Color(red: r, green: g, blue: b);
                }) {
                    Text("Randomize Color")
                        .padding(15)
                        .foregroundStyle(.white)
                }
                .background(.blue)
                .clipShape(Capsule())
            }.padding(.top, 30)
            
        }.padding(20)
    }
}

#Preview {
    GroceryDetail(grocery: GroceryItem(id: UUID().uuidString, name: "Carrot", description: "A healthy vegetable to eat.", perishable: true, quantity: 3.0, imageName: "carrot.fill"))
}
