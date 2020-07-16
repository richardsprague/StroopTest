//
//  StroopStartButtonView.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/25/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI

struct StroopStartButtonView: View {
    var direction: String

    @State var wasPushed = false
    
    @FetchRequest(
       // 2.
       entity: StroopData.entity(),
       // 3.
       sortDescriptors: [
        NSSortDescriptor(keyPath: \StroopData.score, ascending: true)
       ]
       //,predicate: NSPredicate(format: "genre contains 'Action'")
       // 4.
     ) var allData: FetchedResults<StroopData>
    
    var body: some View {

        VStack {
            Text("Tap the logo to start.")
                .padding()
            Text("Max Score: " + String(allData.last?.score.description ?? "0"))
                .padding()

            FancyButtonView(direction: direction)
            
            HStack{
                Spacer().padding()
                NavigationView{
                    Button(action:{self.wasPushed = true
                        })
                    {Text("?")}
                    Spacer()
                }.sheet(isPresented: $wasPushed,
                        onDismiss: {self.wasPushed = false})
                {STHelpScreen(wasPushed: self.$wasPushed)}
            }
        }

        
    }
}


struct StroopStartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return StroopStartButtonView(direction: "Left").environment(\.managedObjectContext, context).environmentObject(STData())
    }
}

struct FancyButtonView: View {
    var direction: String
    @State var wasPushedx = false
        @Environment(\.managedObjectContext) var managedObjectContext
     
    var body: some View {
        NavigationView {
            Button(action: {
                self.wasPushedx = true
            }) {
                Image(/*@START_MENU_TOKEN@*/"StroopStartButton114x114"/*@END_MENU_TOKEN@*/)
                    .renderingMode(.original)
                    .padding(.all)
                    .background(Color.black)
                    .shadow(radius: 10)
            }
        }.sheet(isPresented: $wasPushedx,
                onDismiss: { self.wasPushedx = false }) {
                    STCardView(wasPushed:self.$wasPushedx)
                        .environment(\.managedObjectContext, self.managedObjectContext)
        }
        
        //        .alert(isPresented: $wasPushed) {
        //            Alert(title: Text("Your Score"), message: Text(self.direction))
        //        }
    }
}

