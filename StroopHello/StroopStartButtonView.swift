//
//  StroopStartButtonView.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/25/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct StroopStartButtonView: View {
    var direction: String

    
    var body: some View {

        VStack {
            Text("Tap the logo to start.")
                .padding()
            Text(direction)
                .padding()

            FancyButtonView(direction: direction)
            
            
        }

        
    }
}

struct StroopStartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StroopStartButtonView(direction: "Left")
    }
}

struct FancyButtonView: View {
    var direction: String
    @State var wasPushed = false
    
 
    
    var body: some View {
        NavigationView {
            Button(action: {
                self.wasPushed = true
            }) {
                Image(/*@START_MENU_TOKEN@*/"StroopStartButton114x114"/*@END_MENU_TOKEN@*/)
                    .renderingMode(.original)
                    .padding(.all)
                    .background(Color.black)
                    .shadow(radius: 10)
            }
        }.sheet(isPresented: $wasPushed,
        onDismiss: { self.wasPushed = false }) {
            STCardView(wasPushed:self.$wasPushed, discipline: "pushed")
         }
        
//        .alert(isPresented: $wasPushed) {
//            Alert(title: Text("Your Score"), message: Text(self.direction))
//        }
    }
}

