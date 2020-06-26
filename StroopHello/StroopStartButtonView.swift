//
//  StroopStartButtonView.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/25/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI



struct StroopStartButtonView: View {
    @State var direction: String
    @State var wasPushed = false
    
    var body: some View {
        NavigationView {
        VStack {
            Text("Tap the logo to start.")
                .padding()
            Text(direction)
                .padding()

            Button(action: {
                self.wasPushed = true
            }) {
                Image(/*@START_MENU_TOKEN@*/"StroopStartButton114x114"/*@END_MENU_TOKEN@*/)
                    .renderingMode(.original)
                    .padding(.all)
                    .background(Color.black)
                    .shadow(radius: 10)
            }
            .alert(isPresented: $wasPushed) {
                Alert(title: Text("Your Score"), message: Text(self.direction))
            }
            
            
        }

            NavigationLink(destination: STCardView()) { Text("content") }
        }
    }
}

struct StroopStartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StroopStartButtonView(direction: "Left")
    }
}
