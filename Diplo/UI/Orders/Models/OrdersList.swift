//
//  OrdersList.swift
//  Diplo
//
//  Created by Björn Waltert on 04.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct OrdersList: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Order.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Order.givenName, ascending: true)
    ]) var orders: FetchedResults<Order>
    
    var body: some View {
        List {
            Section  {
                ForEach(orders, id: \.id) { order in
                    OrderCell(order: order)
                }
                .onDelete(perform: deleteEntry)
            }
            .listRowBackground(Color("MainBackgroundColorListRow"))
            .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
    
    func deleteEntry(at offsets: IndexSet) {
        for offset in offsets {
            let order = orders[offset]
            
            moc.delete(order)
        }
        
        try? moc.save()
    }
}

struct OrdersList_Previews: PreviewProvider {
    static var previews: some View {
        OrdersList()
    }
}
