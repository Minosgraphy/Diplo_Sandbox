//
//  ContentView.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var viewRouter = ViewRouter()
    
    var body: some View {
        ZStack {
            MainBackgroundColor()
            TabedView()
        }
    }
}

// MARK: BACKGROUND
struct MainBackgroundColor: View {
    var body: some View {
        Rectangle()
            .fill(Color("MainBackgroundColor"))
            .edgesIgnoringSafeArea(.vertical)
    }
}

// MARK: HEADER
struct Header: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("MainBackgroundColor"))
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height/9)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Good morning,")
                            .font(.custom("Avenir Next", size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        Text("Maximilian Mino")
                            .font(.custom("Avenir Next", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .padding(.leading)
        .padding(.top, 30)
    }
}

// MARK: SHORTCUTS
struct ShortcutsRow: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0 ..< 5) { item in
                    ShortcutCard()
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, 50)
    }
}
struct ShortcutCard: View {
    
    private var cardTitle: String = "neo-Design.ch"
    private var cardDescription: String = "Watch my selfmade animated videos."
    private var webSource: String = "YouTube.com"
    
    var body: some View {
        VStack {
            ZStack {
                // BASECARD
                Group {
                    Rectangle()
                        .fill(Color("MainBackgroundColor"))
                        .frame(width: 246,
                               height: 360)
                        .cornerRadius(30)
                        .shadow(color: Color("MainBackgroundShadowTLeading"),
                                radius: 13, x: -6, y: -6)
                        .shadow(color: Color("MainBackgroundShadowBTrailing"),
                                radius: 13, x: 6, y: 6)
                        .padding()
                }
                
                // MARK: IMAGE & EFFECT
                Group {
                    VStack {
                        ZStack {
                            Image("Image-2")
                                .resizable().aspectRatio(contentMode: .fill)
                                .saturation(0.9)
                                .opacity(0.8)
                                .frame(width: 246,
                                       height: 274)
                            
                            Rectangle()
                                .fill((LinearGradient(gradient: Gradient(colors: [Color(.clear), Color("MainBackgroundColor")]), startPoint: .top, endPoint: .bottom)))
                                .frame(width: 246,
                                       height: 275)
                        }
                        
                        Spacer()
                    }
                    .frame(width: 246,
                           height: 360)
                    .cornerRadius(30)
                }
                
                // TEXT
                Group {
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text(cardTitle)
                                    .font(.custom("Avenir Next", size: 17))
                                    .fontWeight(.bold)
                                
                                Text(cardDescription)
                                    .font(.custom("Avenir Next", size: 14))
                                    .fontWeight(.medium)
                                    .lineLimit(2)
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                    .frame(width: 246,
                           height: 360)
                }
            }
            
            Text(webSource)
                .font(.custom("Avenir Next", size: 14))
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            
            Spacer()
        }
    }
}

// MARK: NEWS
struct NewsRow: View {
    var body: some View {
        Text("News")
    }
}


struct HomeView: View {
    var body: some View {
        Text(" SwiftUI")
    }
}

struct OrdersView: View {
    var body: some View {
        Text("Orders")
            .padding(.top, 50)
    }
}
struct SettingsView: View {
    var body: some View {
        Circle()
            .fill(Color("MainBackgroundColor"))
            .frame(width: 150, height: 150)
            .padding(25)
            .padding(.top, 50)
            .shadow(color: Color("MainBackgroundShadowTLeading"), radius: 13, x: -6, y: -6)
            .shadow(color: Color("MainBackgroundShadowBTrailing"), radius: 13, x: 6, y: 6)
    }
}

// MARK: PREVIEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
