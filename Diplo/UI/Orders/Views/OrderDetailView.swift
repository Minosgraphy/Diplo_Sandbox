//
//  OrderDetailView.swift
//  Diplo
//
//  Created by Björn Waltert on 04.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import CoreData
import SwiftUI

struct OrderDetailView: View {
    
    @FetchRequest(entity: Order.entity(), sortDescriptors: []) var orders: FetchedResults<Order>
    
    let order: Order
    
    var body: some View {
        HStack {
            Text(order.givenName ?? "")
                .font(.custom("Avenir Next", size: 17))
                .fontWeight(.regular)
            
            Text(order.givenName ?? "")
                .font(.custom("Avenir Next", size: 17))
                .fontWeight(.regular)
        }
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let newOrder = Order(context: self.moc)
        
        newOrder.id = UUID()
        newOrder.givenName = "givenName"
        
        return NavigationView {
            OrderDetailView(order: newOrder)
        }
    }
}
