//
//  STTempView.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/13/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct STTempView: View {
    
    @Binding var wasPushed: Bool
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var userData: STData
    @ObservedObject var viewModel = STCardViewModel(message: "Shuffle")
    
    var body: some View {
        VStack{
            Rectangle()
                       .fill(viewModel.color)
                       .frame(width:300, height:400)
                       .padding()
                       .border(self.viewModel.color, width: 1)
                   
    
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
                        print(self.wasPushed ? "match":"no match")
                    }){
                        Text(color)
                    }.padding()
                }
                
            }
            
            Button("Done") {
                self.userData.score = self.viewModel.score
                self.userData.date = self.viewModel.date
                self.userData.addResult()
                //   self.viewModel.addSession(score: self.userData.score, date: self.userData.date, duration: self.userData.duration)
                
                print("userData.score=",self.userData.score)
                let newSession = StroopData(context: self.managedObjectContext)
                
                // 2
                newSession.score = Int32(self.viewModel.score)
                newSession.date = self.viewModel.date
                newSession.duration = 3.14
                print("newSession.score=",newSession.score)
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print("Error saving managed object context: \(error)")
                }
                
            }
        }
    }
}

struct STTempView_Previews: PreviewProvider {
    static var previews: some View {
        STTempView(wasPushed: .constant(false)).environmentObject(STData())
    }
}
