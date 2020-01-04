//
//  AddOrderView.swift
//  Diplo
//
//  Created by Björn Waltert on 04.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Order.entity(), sortDescriptors: []) var orders: FetchedResults<Order>
    
    @State private var id = UUID()
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Group {
                        HStack {
                            TextField("givenName".localized().capitalizeFirstLetter(), text: self.$givenName)
                                .textContentType(.givenName)
                                .disableAutocorrection(true)
                                .autocapitalization(.words)
                                .foregroundColor(.blue)
                            
                            Divider()
                            
                            TextField("familyName".localized().capitalizeFirstLetter(), text: self.$familyName)
                                .textContentType(.familyName)
                                .disableAutocorrection(true)
                                .autocapitalization(.words)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("create".localized().capitalizeFirstLetter()), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    if !self.givenName.isEmpty && !self.familyName.isEmpty {
                        let newOrder = Order(context: self.moc)
                        
                        newOrder.id = self.id
                        newOrder.givenName = self.givenName
                        newOrder.familyName = self.familyName
                        
                        try? self.moc.save()
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    if self.givenName.isEmpty || self.familyName.isEmpty {
                        Text("done".localized().capitalizeFirstLetter())
                    }
                        
                    else {
                        Text("save".localized().capitalizeFirstLetter())
                    }
                }
            )
        }
    }
}

struct AddCitizenView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView()
    }
}
