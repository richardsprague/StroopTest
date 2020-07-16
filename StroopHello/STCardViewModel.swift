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
    
    // for some reason this won't save.
    func finish(){
        let newSession = StroopData(context: self.managedObjectContext)
        newSession.score = Int32(self.card.score)
        newSession.date = self.card.startDate
        newSession.duration = self.card.duration
        do {
            try self.managedObjectContext.save()
         } catch {
           print("viewmodel: Error saving managed object context: \(error)")
            print("score= ",newSession.score)
         }

        
    }
    
   
}


