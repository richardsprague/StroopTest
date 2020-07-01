//
// ColorManager.swift created by Brady Murphy
// [paywall] https://medium.com/better-programming/creating-and-managing-colors-in-swiftui-4c3a85f557ff
//  StroopHello
//
//  Created by Richard Sprague on 7/1/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import Foundation

import SwiftUI

class ColorManager {
    // create static variables for custom colors
    var color = Color.black
    static let Green = Color("Green")
    static let Blue = Color("Blue")
    static let Red = Color("Red")
    static let Random = Color(allColors[Int.random(in: 0...2)])
    init(color:String) {
        self.color = Color(color)
    }
    

    //... add the rest of your colors here
}
