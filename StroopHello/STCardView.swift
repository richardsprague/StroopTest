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
    @EnvironmentObject var STCardData: STCardData
    @State private var counter: Int =  0
    
    var card: STCard
  var body: some View {
    VStack {
        Rectangle()
            .fill(self.card.sColor)
            .frame(width:300, height:400)
            .padding()
            .border(self.card.sColor, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        
        Text(self.card.color)
        HStack {
            Button(action: {
                self.counter+=1
                self.card.randomize()
                //self.card
                //self.cardColor = ColorManager.Random
                //self.wasPushed = false
 
               // self.$STCardData.score
            }){
                Text(self.card.message)
            }.padding()
            ForEach(self.card.buttonsShuffled, id: \.self){ color in
            Button(action: {self.wasPushed = false}){
                Text(color)
            }.padding()
            }
     
        }
        
        

        Button(action: {self.wasPushed = false}) {
        Text("Done")
        }
        Text("State: " + String(self.counter))
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
        STCardView(wasPushed: .constant(false), card: STCard(message:"preview"))
        .environmentObject(STCardData())
    }
}
