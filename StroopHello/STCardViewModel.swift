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
    
    @Published private(set) var color: Color
    @Published var score: Int
    var colorName: String
    var buttonsShuffled = [String]()
    var message: String
   
    
    init(message:String){
        self.card = .init(message: message)
        self.message = self.card.message
        self.color = self.card.sColor
        self.colorName = self.card.color
        self.buttonsShuffled = self.card.buttonsShuffled
        self.score = 0
    }
    
    func changeCardColor(){
        self.card.randomize()
        self.color = self.card.sColor
        self.colorName = self.card.color
    }
    
    func matchesCardColor(colorString:String) -> Bool {
        
        if self.colorName == colorString {
            self.score+=1
            return true
        }
        else {
            return false
            
        }
        
    }

}

