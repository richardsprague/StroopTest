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
    
    var cardColor: ColorManager //Randomize()
    
    var card: STCard
  var body: some View {
    VStack {
        Rectangle()
            .fill(cardColor.color)
            .frame(width:300, height:400)
            .padding()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        
        Text(card.color)
        HStack {
            Button(action: {
                self.counter+=1
                self.cardColor.Randomize()
                //self.cardColor = ColorManager.Random
                //self.wasPushed = false
 
               // self.$STCardData.score
            }){
                Text(card.message)
            }.padding()
            Button(action: {self.wasPushed = false}){
                Text("color2")
            }.padding()
            Button(action: {self.wasPushed = false}){
                Text("color3")
            }.padding()
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
        STCardView(wasPushed: .constant(false), cardColor: ColorManager.init(color: "Red"), card: STCard(message:"preview"))
        .environmentObject(STCardData())
    }
}
