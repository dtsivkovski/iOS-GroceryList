//
//  AddGroceryItem.swift
//  GroceryProject
//
//  Created by Daniel Tsivkovski on 4/11/25.
//

import SwiftUI

struct AddGroceryItem: View {
    
    @State var groceryList: GroceryList;
    @Binding var path: NavigationPath;
    
    @State var name: String = "";
    @State var description: String = "";
    @State var perishable: Bool = false;
    @State var quantity: Double = 1;
    @State var selectedImage: Int = 1;
    
    var body: some View {
        Form {
            Section(header: Text("Add a new grocery to your list!")) {
                VStack (alignment: .leading) {
                    Text("Choose an icon").font(.headline)
                    // this allows the user to select from 3 different icon options for their grocery item
                    HStack {
                        VStack {
                            // option 1 - carrot.fill
                            Button(action: {selectedImage = 0}) {
                                Image(systemName: "carrot.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .foregroundStyle(selectedImage == 0 ? .blue : .gray)
                                    .frame(width: 70)
                                    .scaleEffect(selectedImage == 0 ? 1.2 : 1)
                            }
                            .buttonStyle(.plain)
                        }
                        Spacer()
                        VStack {
                            // option 2- cart.fill
                            Button(action: {selectedImage = 1}) {
                                Image(systemName: "cart.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .foregroundStyle(selectedImage == 1 ? .blue : .gray)
                                    .frame(width: 70)
                                    .scaleEffect(selectedImage == 1 ? 1.2 : 1)
                            }
                            .buttonStyle(.plain)
                        }
                        Spacer()
                        VStack {
                            // option 3 - gift.fill
                            Button(action: {selectedImage = 2}) {
                                Image(systemName: "gift.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .foregroundStyle(selectedImage == 2 ? .blue : .gray)
                                    .frame(width: 70)
                                    .scaleEffect(selectedImage == 2 ? 1.2 : 1)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack (alignment: .leading) {
                    // grocery item name
                    Text("Your item name").font(.headline)
                    TextField("Enter a name", text: $name)
                }
                VStack (alignment: .leading) {
                    // description for the grocery item
                    Text("Item description").font(.headline)
                    TextField("Enter a description", text: $description)
                }
                VStack(alignment: .leading) {
                    // quantity of the item
                    Text("How many?").font(.headline)
                    Stepper("\(quantity.formatted())", value: $quantity, step: 0.5)
                }
                Toggle(isOn: $perishable) {
                    // toggle for perishable
                    Text("Perishable").font(.headline)
                }
            }
            Button(action: addNewGroceryItem) {
                Text("Add Item")
            }
        }
    }
    
    func addNewGroceryItem() {
        let selectedImageString = selectedImage == 0 ? "carrot.fill" : selectedImage == 1 ? "cart.fill" : "gift.fill";
        let newItem = GroceryItem(id: UUID().uuidString, name: name, description: description, perishable: perishable, quantity: quantity, imageName: selectedImageString);
        groceryList.groceries.append(newItem);
        path.removeLast();
    }
    
}

#Preview {
    ContentView()
}
