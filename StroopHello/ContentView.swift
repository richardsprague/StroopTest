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
    @EnvironmentObject var userData: STData
    var pressed : String
    
    
    let  pressed_text = "something"
    
    var body: some View {
 
            HStack {
        
                TabView(selection: $selection){
                
                    StroopStartButtonView(direction: "Right")
                        .tabItem {
                            VStack {
                                // Image("home-7")
                                Image(systemName: "arrow.2.squarepath")
                                Text("First")
                            }
                        }
                        .tag(0)
                    .environmentObject(self.userData)
                    
                    Text("Results")
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image(systemName: "chart.bar.fill")
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
        ContentView(pressed: "something")
    }
}


