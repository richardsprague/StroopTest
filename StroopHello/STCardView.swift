//
//  STCardView.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/26/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct STCardView: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "backward.fill")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                
            }
            .navigationBarTitle("Next Screen Please", displayMode: .inline)
            Text("ok")
                .font(.largeTitle)
            
        }
    }}

struct STCardView_Previews: PreviewProvider {
    static var previews: some View {
        STCardView()
    }
}
