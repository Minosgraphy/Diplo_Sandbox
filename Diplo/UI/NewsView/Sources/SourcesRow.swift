//
//  SourcesRow.swift
//  Diplo
//
//  Created by Björn Waltert on 01.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct SourceRow : View {
    var source: Source
    
    var body: some View {
        HStack {
            Text(source.name)
        }
    }
}
