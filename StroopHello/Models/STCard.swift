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
    var score: Int

    
    init(message:String){
        self.score = 0
        self.message = message
        self.color = ALLCOLORS[Int.random(in: 0...(ALLCOLORS.count - 1))]
        self.sColor = ColorManager(color: self.color).color
        self.buttonsShuffled = ALLCOLORS.shuffled()
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
