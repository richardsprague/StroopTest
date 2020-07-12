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
                    
                   STResultsView()
                        .tabItem {
                            VStack {
                                Image(systemName: "chart.bar.fill")
                                Text("Results")
                            }
                        }
                        .tag(1)
                   .environmentObject(self.userData)
                    STSettingsView()
                        .tabItem {
                            VStack {
                                Image("config30x30")
                                Text("Settings")
                            }
                        }
                        .tag(2)
                    .environmentObject(self.userData)
                }
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return ContentView(pressed: "something").environment(\.managedObjectContext, context)
    }
}


