//
//  STCardView.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/6/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct STCardView: View {
    @Binding var wasPushed: Bool
    @EnvironmentObject var userData: STData
    @ObservedObject var viewModel = STCardViewModel(message: "Shuffle")

 
    
    
    
  var body: some View {
    VStack {
        Rectangle()
            .fill(viewModel.color)
            .frame(width:300, height:400)
            .padding()
            .border(self.viewModel.color, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        
        Text(viewModel.colorName)
        HStack {
            Button(action: {
                
                self.viewModel.changeCardColor()
                
            }){
                Text(self.viewModel.message)
            }.padding()
            ForEach(self.viewModel.buttonsShuffled, id: \.self){ color in
                Button(action: {
                    self.wasPushed =                 self.viewModel.matchesCardColor(colorString: color)
                }){
                    Text(color)
                }.padding()
            }
            
        }
        
        

        Button(action: {
            self.userData.score = self.viewModel.score
            self.userData.date = Date()
            self.userData.addResult()
            self.wasPushed = false}) {
        Text("Done")
        }
        Text("Score: " + String(self.viewModel.score))
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Image(systemName: "backward.fill")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            
        }
}}}


struct STCardView_Previews: PreviewProvider {
    static var previews: some View {
        STCardView(wasPushed: .constant(false))
        .environmentObject(STData())
    }
}
