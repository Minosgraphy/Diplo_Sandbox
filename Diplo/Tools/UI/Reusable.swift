//
//  Reusable.swift
//  Diplo
//
//  Created by Björn Waltert on 05.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import SwiftUI

struct Reusable: View {
    var body: some View {
        Text("")
    }
}

// MARK: - Main Background
struct MainBackground: View {
    var body: some View {
        Rectangle()
            .fill(Color("MainBackgroundColor"))
            .edgesIgnoringSafeArea(.vertical)
    }
}

// MARK: - Designable Row
struct DRow: View {
    
    var iconColor: Color = Color(#colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1))
    var iconImg: String = "flame"
    var title: String = "apps"
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(iconColor)
                
                Image(systemName: iconImg)
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            }
            .frame(width: 30, height: 30, alignment: .center)
            .cornerRadius(7)
            
            Text(title.localized().capitalizeFirstLetter())
                .font(.custom("Avenir Next", size: 17))
                .fontWeight(.regular)
        }
    }
}


// MARK: - Preview Section
struct Reusable_Previews: PreviewProvider {
    static var previews: some View {
        Reusable()
    }
}
