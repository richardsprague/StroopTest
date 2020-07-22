//
//  STSceneView.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/21/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct STSceneView: View {
        var userData = STData()
        @Environment(\.managedObjectContext) var managedObjectContext
        @ObservedObject var viewModel = STCardViewModel(message: "Shuffle")

        
      var body: some View {
        VStack {
            ZStack{
            Rectangle()
                .fill(viewModel.color)
                .frame(width:300, height:400)
                .padding()
                .border(self.viewModel.color, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
            Text(viewModel.colorName)
            }
            HStack {
                Button(action: {
                    
                    self.viewModel.changeCardColor()
                    
                }){
                    Text(self.viewModel.message)
                }.padding()
                ForEach(self.viewModel.buttonsShuffled, id: \.self){ color in
                    Button(action: {
                         self.viewModel.finish()
                    }){
                        Text(color)
                    }.padding()
                }
                
            }
            
            
            
            Button("Done") {
                
                self.userData.score = self.viewModel.score
                self.userData.date = Date()
                self.userData.addResult()
                
                self.viewModel.finish()
            }




            
            
            Text("Score: " + String(self.viewModel.score))

    }}
}



struct STSceneView_Previews: PreviewProvider {
    static var previews: some View {
        STSceneView()
    }
}
