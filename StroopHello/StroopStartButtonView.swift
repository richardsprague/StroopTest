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
    @State var wasPushedx = false
     
    var body: some View {
        NavigationView {
            Button(action: {
                self.wasPushedx = true
            }) {
                Image(/*@START_MENU_TOKEN@*/"StroopStartButton114x114"/*@END_MENU_TOKEN@*/)
                    .renderingMode(.original)
                    .padding(.all)
                    .background(Color.black)
                    .shadow(radius: 10)
            }
        }.sheet(isPresented: $wasPushedx,
                onDismiss: { self.wasPushedx = false }) {
                    STCardView(wasPushed:self.$wasPushedx, card: STCard(message:"from startbutton"))
        }
        
        //        .alert(isPresented: $wasPushed) {
        //            Alert(title: Text("Your Score"), message: Text(self.direction))
        //        }
    }
}

