//
//  STCardView.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/26/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI


struct STCardView: View {
    @Binding var wasPushed: Bool
  let discipline: String
  var body: some View {
    VStack {
        Text(discipline)
        Button(action: {self.wasPushed = false}) {
        Text("Done")
        }

        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Image(systemName: "backward.fill")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            
        }

    }
}
}


struct STCardView_Previews: PreviewProvider {
 
    static var previews: some View {
        STCardView(wasPushed: .constant(false), discipline: "preview")
    }
}
