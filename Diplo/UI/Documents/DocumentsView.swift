//
//  DocumentsView.swift
//  Diplo
//
//  Created by Björn Waltert on 27.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI

struct DocumentsView: View {
    var body: some View {
        HStack {
            Image(systemName: "doc.text").imageScale(.large)
            Text("Documents")
                .font(.custom("Avenir Next", size: 28)).fontWeight(.regular)
        }
    }
}

struct DocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsView()
    }
}
