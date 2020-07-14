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
            Button("Add") {
                let newSession = StroopData(context: self.managedObjectContext)
                
                // 2
                newSession.score = Int32(17)
                newSession.date = Date()
                newSession.duration = 3.14
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print("Error saving managed object context: \(error)")
                }
                
            }
        }
    }
}

struct STSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        STSettingsView()
    }
}
