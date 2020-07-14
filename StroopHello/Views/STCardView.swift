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
    @Environment(\.managedObjectContext) var managedObjectContext
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
                    self.wasPushed = self.viewModel.matchesCardColor(colorString: color)
                }){
                    Text(color)
                }.padding()
            }
            
        }
        
        
        
        Button("Done") {
            self.userData.score = self.viewModel.score
            self.userData.date = Date()
            self.userData.addResult()
            //   self.viewModel.addSession(score: self.userData.score, date: self.userData.date, duration: self.userData.duration)
            
            print("userData.score=",self.userData.score)
            let newSession = StroopData(context: self.managedObjectContext)
            
            // 2
            newSession.score = Int32(self.viewModel.score)
            newSession.date = self.viewModel.date
            newSession.duration = Date().timeIntervalSince(self.userData.date)
            print("newSession.score=",newSession.score)
            
            do {
                try self.managedObjectContext.save()
            } catch {
                print("Error saving managed object context: \(error)")
            }
            
            
            
            
            self.wasPushed = false
        }
        
        
        Text("Score: " + String(self.viewModel.score))
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Image(systemName: "backward.fill")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            
        }
}}
}





struct STCardView_Previews: PreviewProvider {
    static var previews: some View {
        STCardView(wasPushed: .constant(false))
        .environmentObject(STData())
    }
}
