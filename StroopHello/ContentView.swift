//
//  ContentView.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/24/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
 
            HStack {
        
                TabView(selection: $selection){
                    Text("Home")
                        .font(.largeTitle)
                        .tabItem {
                            VStack {
                                Image("home-7")
                                Text("First")
                            }
                        }
                        .tag(0)
                    Text("Results")
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image("Chart_Up")
                                Text("Results")
                            }
                        }
                        .tag(1)
                    Text("Settings are here")
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image("config30x30")
                                Text("Settings")
                            }
                        }
                        .tag(2)
                }
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
