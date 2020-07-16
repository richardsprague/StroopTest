//
//  STHelpScreen.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/16/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct STHelpScreen: View {
    @Binding var wasPushed: Bool
    var body: some View {
        VStack{
            Text("Help").padding()
            Spacer()
            Text("Press the word that represents the color on the card").padding()
            Spacer()
            Button("ok"){
                self.wasPushed = false
            }
        
        }
    }
}

struct STHelpScreen_Previews: PreviewProvider {
    static var previews: some View {
        STHelpScreen(wasPushed: .constant(true))
    }
}
