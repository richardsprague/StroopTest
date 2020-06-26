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
    
    var body: some View {
        VStack {
            Text("Tap the logo to start.")
                .padding()
            Text(direction)
           
                
            Image(/*@START_MENU_TOKEN@*/"StroopStartButton114x114"/*@END_MENU_TOKEN@*/)
                .padding(.all)
                .background(Color.black)
                .shadow(radius: 10)
        }
    }
}

struct StroopStartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StroopStartButtonView(direction: "Left")
    }
}
