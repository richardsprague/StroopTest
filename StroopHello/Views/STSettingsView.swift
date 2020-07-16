//
//  STSettingsView.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/9/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct STSettingsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack {
            Text("This is the settings view").font(.title).padding()
                NavigationView {
                    VStack{
                    NavigationLink(destination: Text("Second View")) {
                        Text("Click Here")
                    FancyButtonView(direction: "left")
                    }
                    }
                    .navigationBarTitle("Settings Details")
                }
            
        }
    }
}

struct STSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        STSettingsView()
    }
}
