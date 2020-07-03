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

    
    init(message:String){
        self.message = message
        self.color = ALLCOLORS[Int.random(in: 0...(ALLCOLORS.count - 1))]
        self.sColor = ColorManager(color: self.color).color
        self.buttonsShuffled = ["Red","Blue","Green"]
    }
    
    func randomize(){
        self.color = ALLCOLORS[Int.random(in: 0...2)]
        self.sColor = ColorManager(color: color ).color
    }
    
//   var colorChoices = [String]()
    
//    for _ in 1...3{
//        colorChoices.append()allColors[Int.random(in: 0...2)]
//    }
    
    
}
