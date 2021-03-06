//
//  STColor.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/30/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import Foundation

import SwiftUI


let ALLCOLORS = ["Red","Green","Blue"]

//
class STCard: Identifiable {  // Identifiable protocol makes it easier to loop in a View
    var color: String
    var sColor: Color
    var message: String
    var buttonsShuffled = [String]()
    var cardData: STData
    var score: Int {
        get {cardData.score}
        set(newScore) {
            //self.score = newScore
            cardData.score = newScore
        }
    }
    var startDate: Date {
        get {cardData.date}
        set (newDate){
            cardData.date = newDate
        }
    }
    var duration: Double {
        get {cardData.duration}
        set {cardData.duration = Date().timeIntervalSince(cardData.date)}
    }

    
    init(message:String){
        self.message = message
        self.color = ALLCOLORS[Int.random(in: 0...(ALLCOLORS.count - 1))]
        self.sColor = ColorManager(color: self.color).color
        self.buttonsShuffled = ALLCOLORS.shuffled()
        
        self.cardData = STData()
        self.cardData.score = 0
        self.cardData.date = Date()
        self.cardData.duration = Date().timeIntervalSince(self.cardData.date)
        
        
    }
    
    func randomize(){
        self.color = ALLCOLORS[Int.random(in: 0...2)]
        self.sColor = ColorManager(color: color ).color
    }
    
    func matchesCardColor(colorString:String) -> Bool {
        
        if colorString == self.color {
            self.score+=1
            return true
        }
        else {
            return false
            
        }
        
    }


}

struct STCard_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
