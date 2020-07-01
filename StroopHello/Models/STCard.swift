//
//  STColor.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/30/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import Foundation

import SwiftUI


let allColors = ["Red","Green","Blue"]

//
class STCard {
    var color: String
    var sColor: ColorManager
    var message: String
    
    init(message:String){
        self.message = message
        self.sColor = ColorManager(color: "Black")
        self.color = allColors[Int.random(in: 0...2)]
    }
    
//   var colorChoices = [String]()
    
//    for _ in 1...3{
//        colorChoices.append()allColors[Int.random(in: 0...2)]
//    }
    
    
}
