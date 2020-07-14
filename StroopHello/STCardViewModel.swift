//
//  STCardView.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/26/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI
import Combine


class STCardViewModel:  ObservableObject {
    
     var card: STCard
    
        @Environment(\.managedObjectContext) var managedObjectContext
    
    @Published private(set) var color: Color
    @Published var score: Int
    var colorName: String
    var date: Date
    var buttonsShuffled = [String]()
    var message: String
    
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

   
    
    init(message:String){
        self.card = .init(message: message)
        self.message = self.card.message
        self.color = self.card.sColor
        self.colorName = self.card.color
        self.date = self.card.startDate
        self.buttonsShuffled = self.card.buttonsShuffled
        self.score = self.card.score
    }
    
    func changeCardColor(){
        self.card.randomize()
        self.color = self.card.sColor
        self.colorName = self.card.color
    }
    
    func matchesCardColor(colorString:String) -> Bool {
        
        if self.colorName == colorString {
            self.score+=1
            self.card.score = self.score
            return true
        }
        else {
            return false
            
        }
        
    }
    
    
    
    func addSession(score: Int, date: Date, duration: Double) {
      // 1
        let newSession = StroopData(context: self.managedObjectContext)

      // 2
        newSession.score = Int32(63)
      newSession.date = Date()
        newSession.duration = 4.75

      // 3
      saveContext()
    }

    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
}

