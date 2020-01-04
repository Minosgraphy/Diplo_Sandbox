//
//  OrderCell.swift
//  Diplo
//
//  Created by Björn Waltert on 04.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import CoreData
import SwiftUI

struct OrderCell: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Order.entity(), sortDescriptors: []) var orders: FetchedResults<Order>
    
    let order: Order
    
    var body: some View {
        NavigationLink(destination: OrderDetailView(order: order)) {
            HStack {
                Text(order.givenName ?? "")
                    .font(.custom("Avenir Next", size: 17))
                    .fontWeight(.semibold)
                
                Text(order.familyName ?? "")
                    .font(.custom("Avenir Next", size: 17))
                    .fontWeight(.semibold)
            }
        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let newOrder = Order(context: self.moc)
        
        newOrder.id = UUID()
        newOrder.givenName = "Hans"
        newOrder.familyName = "Habermann"
        
        return NavigationView {
            OrderCell(order: newOrder)
        }
    }
}
