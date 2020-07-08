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
    var score: Int
    var colorname: String
    var buttonsShuffled = [String]()
    var message: String
   
    
    init(message:String){
        self.card = .init(message: message)
        self.message = self.card.message
        self.color = self.card.sColor
        self.colorname = self.card.color
        self.buttonsShuffled = self.card.buttonsShuffled
        self.score = 0
    }
    
    func randomize(){
        self.card.randomize()
        self.color = self.card.sColor
        self.colorname = self.card.color
    }
    
    func matchesCardColor(colorString:String) -> Bool {
        return colorString == self.colorname ? true : false
        
    }

}

